;;; windows.el -- summary
;;; Commentary:
;;; Windows management things, mostly with purpose
;;; Code:
(require 'window-purpose)
(purpose-mode t)

;; Ruby specific
(add-to-list 'purpose-user-regexp-purposes '("_spec.rb\\(<.*>\\)?$" . test))
(add-to-list 'purpose-user-regexp-purposes
             '("COMMIT_EDITMSG\\(<.*>\\)?$" . code))
(add-to-list 'purpose-user-mode-purposes '(ruby-mode . code))
(add-to-list 'purpose-user-mode-purposes '(yaml-mode . code))

;; Elixir
(add-to-list 'purpose-user-regexp-purposes '("_test.exs\\(<.*>\\)?$" . test))
(add-to-list 'purpose-user-mode-purposes '(elixir-mode . code))

;; Tools
(add-to-list 'purpose-user-mode-purposes '(magit-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(help-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(helm-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . tools))

;; Markdown
(add-to-list 'purpose-user-mode-purposes '(markdown-mode . code))

;; Elisp
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . code))

(setq purpose-use-default-configuration nil)
(purpose-compile-user-configuration)
(purpose-load-window-layout 'coding_with_magit)

;;; windows.el ends here
