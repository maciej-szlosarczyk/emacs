(cl-defun erlang/emacs-path (erlang-version)
  (car (split-string
        (shell-command-to-string
         (format "find $HOME/.asdf/installs/erlang/%s/ -name erlang.el"
                 erlang-version)) "erlang.el")))

(cl-defun erlang/erlang-path (erlang-version)
  (format "$HOME/.asdf/installs/erlang/%s/" erlang-version))

(defun erlang/erlang-plist (erlang-version)
  "Create property list for ERLANG-VERSION."
  (list :version erlang-version
        :erlang-path (erlang/erlang-path erlang-version)
        :emacs-path (erlang/emacs-path erlang-version)))

(cl-defun erlang/installed-erlangs ()
  (split-string
   (shell-command-to-string
    (format "asdf list erlang"))))

(cl-defun erlang/available-versions--plist ()
  (mapcar 'erlang/erlang-plist (erlang/installed-erlangs)))

(setq erlang/available-versions (erlang/available-versions--plist))

(cl-defun erlang/currently-in-use ()
  (car (split-string (shell-command-to-string "asdf current erlang"))))

(cl-defun erlang/current-version--plistp (erlang-plist)
  (equal (plist-get erlang-plist :version) (erlang/currently-in-use)))

(cl-defun erlang/current-plist ()
  (seq-find 'erlang/current-version--plistp erlang/available-versions))

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

(defun erlang/activate-erlang-mode ()
  "All things for all Erlang, including header files."
  (when (featurep 'erlang-start) (unload-feature 'erlang-start))

  (setq erlang/current-erlang (erlang/current-plist))

  (add-to-list (make-local-variable 'load-path)
               (plist-get erlang/current-erlang :emacs-path))

  (add-to-list (make-local-variable 'exec-path)
               (format "%slib/tools-3.1/emacs"
                       (plist-get erlang/current-erlang :erlang-path)))

  (setq-local erlang-man-root-dir
              (format "%sman"
                      (plist-get erlang/current-erlang :erlang-path)))

  (require 'erlang-start)

  ;; Set specific ctags command
  (setq-local
   ctags/refresh-command
   (format
    "uctags -e -R --languages=erlang -f %sTAGS %ssrc %sdeps %sapps %s_build %stest %slib/stdlib-* %slib/kernel-*"
    (projectile-project-root) (projectile-project-root)
    (projectile-project-root) (projectile-project-root)
    (projectile-project-root) (projectile-project-root)
    (plist-get erlang/current-erlang :erlang-path)
    (plist-get erlang/current-erlang :erlang-path)))

  ;; Add include path so that Erlang does not complain about
  ;; missing header files.
  (setq-local flycheck-erlang-include-path
              (list (format "%sdeps" (projectile-project-root))
                    (format "%sinclude" (projectile-project-root))
                    (format "%sapps" (projectile-project-root))))

  ;; (setq-local flycheck-erlang-library-path
  ;;             (list (format "%sdeps" (projectile-project-root))
  ;;                   (format "%sapps" (projectile-project-root))))

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-etags)))

(add-hook 'erlang-mode-hook 'erlang/activate-erlang-mode)

(define-derived-mode my-erlang-mode erlang-mode "My Erlang mode"
  "A mode for Erlang things"

  (activate-erlang-mode)
  ;; Enable flycheck
  (flycheck-select-checker 'erlang-otp)

  ;; Automatically update tags on save
  (ctags/update-this-mode-on-save 'erlang-mode))
