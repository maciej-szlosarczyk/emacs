;;; windows.el -- summary
;;; Commentary:
;;; Windows management things, mostly with purpose
;;; Code:
(require 'window-purpose)
(purpose-mode t)

;; Set everything to use code window
(add-to-list 'purpose-user-mode-purposes '(fundamental-mode . code))

;; Test
(add-to-list 'purpose-user-regexp-purposes
             '("_spec\\.rb\\(<.*>\\)?$" . test)) ;; Rspec
(add-to-list 'purpose-user-regexp-purposes
             '("_test\\.exs\\(<.*>\\)?$" . test)) ;; Exunit
(add-to-list 'purpose-user-regexp-purposes
             '("test_.*\\.py\\(<.*>\\)?$" . test)) ;; Pytest

(add-to-list 'purpose-user-mode-purposes '(shell-mode . test))
(add-to-list 'purpose-user-mode-purposes '(magit-diff-mode . test))

;; Enumerate through all stuff.
(add-to-list 'purpose-user-regexp-purposes
             '("COMMIT_EDITMSG\\(<.*>\\)?$" . code))
(add-to-list 'purpose-user-mode-purposes '(diff-mode . code))
(add-to-list 'purpose-user-mode-purposes '(ruby-mode . code))
(add-to-list 'purpose-user-mode-purposes '(elixir-mode . code))
(add-to-list 'purpose-user-mode-purposes '(rust-mode . code))
(add-to-list 'purpose-user-mode-purposes '(haskell-mode . code))
(add-to-list 'purpose-user-mode-purposes '(web-mode . code))
(add-to-list 'purpose-user-mode-purposes '(java-mode . code))
(add-to-list 'purpose-user-mode-purposes '(python-mode . code))
(add-to-list 'purpose-user-mode-purposes '(javascript-mode . code))
(add-to-list 'purpose-user-mode-purposes '(xml-mode . code))

;; Tools
(add-to-list 'purpose-user-mode-purposes '(dired-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(magit-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(help-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(helm-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(reb-mode . tools)) ;; Regexp builder

;; Markdown and others
(add-to-list 'purpose-user-mode-purposes '(markdown-mode . code))

;; Emacs lisp
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . code))

(setq purpose-use-default-configuration nil)
(purpose-compile-user-configuration)

;; Load configuration by default
(purpose-load-window-layout "coding_with_magit")
;;; windows.el ends here
