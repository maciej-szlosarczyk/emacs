;;; languages/erlang -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-lsp)
(require 'icejam-projectile)

(declare-function lsp "lsp-mode" nil)
(declare-function column-enforce-n "column-enforce-mode" (number))

(use-package erlang
  :defer t
  :straight t
  :requires (lsp-mode lsp-ui))

(cl-defun icejam/erlang-emacs-path (erlang-version)
  "Find path to Emacs tooling for ERLANG-VERSION."
  (car (split-string
        (shell-command-to-string
         (format "find $HOME/.asdf/installs/erlang/%s/ -name erlang.el"
                 erlang-version)) "erlang.el")))

(cl-defun icejam/erlang-path (erlang-version)
  "Find asdf path for ERLANG-VERSION."
  (format "$HOME/.asdf/installs/erlang/%s/" erlang-version))

(defun icejam/erlang-plist (erlang-version)
  "Create property list for ERLANG-VERSION."
  (list :version erlang-version
        :erlang-path (icejam/erlang-path erlang-version)
        :emacs-path (icejam/erlang-emacs-path erlang-version)))

(cl-defun icejam/installed-erlangs ()
  "List Erlang versions installed with asdf."
  (split-string
   (shell-command-to-string
    (format "asdf list erlang"))))

(cl-defun icejam/erlang-available-versions--plist ()
  "Create plist for all installed Erlang versions."
  (mapcar 'icejam/erlang-plist (icejam/installed-erlangs)))

(defvar icejam/erlang-available-versions (icejam/erlang-available-versions--plist))

(cl-defun icejam/erlang-currently-in-use ()
  "Get Erlang version currently in use."
  (car (split-string (shell-command-to-string "asdf current erlang"))))

(cl-defun icejam/erlang-current-version--plistp (erlang-plist)
  "Check if currently in use Erlang is the same as the one in ERLANG-PLIST."
  (equal (plist-get erlang-plist :version) (icejam/erlang-currently-in-use)))

(cl-defun icejam/erlang-current-plist ()
  "Create plist from current Erlang version."
  (seq-find 'erlang/current-version--plistp icejam/erlang-available-versions))

;; Flycheck checker for Erlang
(flycheck-define-checker erlang-otp
  "An Erlang syntax checker using the Erlang interpreter."
  :command ("erlc" "-o" temporary-directory "-Wall"
            "-I" "../include" "-I" "../../include"
            "-I" "../../../include" source)
  :error-patterns
  ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
   (error line-start (file-name) ":" line ": " (message) line-end))
  :modes (my-erlang-mode))

(defun icejam/activate-erlang-mode ()
  "All things for all Erlang, including header files."
  (when (featurep 'erlang-start) (unload-feature 'erlang-start))

  (defvar erlang/current-erlang (icejam/erlang-current-plist))

  (add-to-list (make-local-variable 'load-path)
               (plist-get erlang/current-erlang :emacs-path))

  (add-to-list (make-local-variable 'exec-path)
               (format "%slib/tools-3.1/emacs"
                       (plist-get erlang/current-erlang :erlang-path)))

  (setq-local erlang-man-root-dir
              (format "%sman"
                      (plist-get erlang/current-erlang :erlang-path)))

  (require 'erlang-start)
  (icejam/set-indent 4)
  (column-enforce-n 80)

  ;; Add include path so that Erlang does not complain about
  ;; missing header files.
  (setq-local flycheck-erlang-include-path
              (list (format "%sdeps" (projectile-project-root))
                    (format "%s_build/default/lib" (projectile-project-root))
                    (format "%sinclude" (projectile-project-root))
                    (format "%sapps" (projectile-project-root))))

  (setq-local flycheck-erlang-library-path
              (list (format "%sdeps" (projectile-project-root))
                    (format "%s_build/default/lib" (projectile-project-root))
                    (format "%sapps" (projectile-project-root))))

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet))

  ;; Start LSP server
  (lsp))

(add-hook 'erlang-mode-hook 'icejam/activate-erlang-mode)

(provide 'icejam-lang-erlang)
;;; icejam-lang-erlang.el ends here
