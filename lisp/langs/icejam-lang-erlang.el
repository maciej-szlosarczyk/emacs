;;; languages/erlang -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-lsp)

(declare-function lsp "lsp-mode" nil)
(declare-function column-enforce-n "column-enforce-mode" (number))

(use-package erlang
  :defer t
  :ensure (:depth 1)
  :after (lsp lsp-ui))

(cl-defun icejam-erlang-emacs-path (erlang-version)
  "Find path to Emacs tooling for ERLANG-VERSION."
  (car (split-string
        (shell-command-to-string
         (format "find $HOME/.asdf/installs/erlang/%s/ -name erlang.el"
                 erlang-version)) "erlang.el")))

(cl-defun icejam-erlang-path (erlang-version)
  "Find asdf path for ERLANG-VERSION."
  (format "$HOME/.asdf/installs/erlang/%s/" erlang-version))

(defun icejam-erlang-plist (erlang-version)
  "Create property list for ERLANG-VERSION."
  (list :version erlang-version
        :erlang-path (icejam-erlang-path erlang-version)
        :emacs-path (icejam-erlang-emacs-path erlang-version)))

(cl-defun icejam-installed-erlangs ()
  "List Erlang versions installed with asdf."
  (split-string
   (shell-command-to-string
    (format "asdf list erlang"))))

(cl-defun icejam-erlang-available-versions--plist ()
  "Create plist for all installed Erlang versions."
  (mapcar 'icejam-erlang-plist (icejam-installed-erlangs)))

(defvar icejam-erlang-available-versions (icejam-erlang-available-versions--plist))

(cl-defun icejam-erlang-currently-in-use ()
  "Get Erlang version currently in use."
  (car (split-string (shell-command-to-string "asdf current erlang"))))

(cl-defun icejam-erlang-current-version--plistp (erlang-plist)
  "Check if currently in use Erlang is the same as the one in ERLANG-PLIST."
  (equal (plist-get erlang-plist :version) (icejam-erlang-currently-in-use)))

(cl-defun icejam-erlang-current-plist ()
  "Create plist from current Erlang version."
  (seq-find 'icejam-erlang-current-version--plistp icejam-erlang-available-versions))

(defun icejam-activate-erlang-mode ()
  "All things for all Erlang, including header files."
  (when (featurep 'erlang-start) (unload-feature 'erlang-start))

  (defvar erlang/current-erlang (icejam-erlang-current-plist))

  (add-to-list (make-local-variable 'load-path)
               (plist-get erlang/current-erlang :emacs-path))

  (add-to-list (make-local-variable 'exec-path)
               (format "%slib/tools-3.1/emacs"
                       (plist-get erlang/current-erlang :erlang-path)))

  (setq-local erlang-man-root-dir
              (format "%sman"
                      (plist-get erlang/current-erlang :erlang-path)))

  (require 'erlang-start)
  (icejam-set-indent 4)
  (column-enforce-n 80)

  ;; Start LSP
  (lsp)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'erlang-mode-hook 'icejam-activate-erlang-mode)

(provide 'icejam-lang-erlang)
;;; icejam-lang-erlang.el ends here
