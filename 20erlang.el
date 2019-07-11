;; Add erlang installation to load path
(setq erlang-asdf-root "$HOME/.asdf/installs/erlang/21.3.8/")

(setq load-path
      (cons (format "%slib/tools-3.1/emacs" erlang-asdf-root)
            load-path))

(require 'erlang-start)

(setq erlang-root-dir erlang-asdf-root)
(setq exec-path (cons (format "%sbin" erlang-asdf-root) exec-path))
(setq erlang-man-root-dir (format "%sman" erlang-asdf-root))

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

(defun activate-erlang-mode ()
  "All things for all Erlang, including header files."

  ;; Set specific ctags command
  (setq-local
   ctags/refresh-command
   (format
    "ctags -e -R --languages=erlang -f %sTAGS %s. %slib/stdlib-* %slib/kernel-*"
    (projectile-project-root) (projectile-project-root)
    erlang-asdf-root erlang-asdf-root))

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-etags company-yasnippet)))

(add-hook 'erlang-mode-hook 'activate-erlang-mode)

(define-derived-mode my-erlang-mode erlang-mode "My Erlang mode"
  "A mode for Erlang things"

  (activate-erlang-mode)
  ;; Enable flycheck
  (flycheck-select-checker 'erlang-otp)

    ;; Automatically update tags on save
  (ctags/update-this-mode-on-save 'erlang-mode))
