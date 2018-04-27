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
             '("_test\\.rb\\(<.*>\\)?$" . test)) ;; Minitest
(add-to-list 'purpose-user-regexp-purposes
             '("_test\\.exs\\(<.*>\\)?$" . test)) ;; ExUnit
(add-to-list 'purpose-user-regexp-purposes
             '("test_.*\\.py\\(<.*>\\)?$" . test)) ;; Pytest
(add-to-list 'purpose-user-regexp-purposes
             '("tests.rs\\(<.*>\\)?$" . test)) ;; Rust tests
(add-to-list 'purpose-user-regexp-purposes
             '("_test.go\\(<.*>\\)?$" . test)) ;; Go tests

(add-to-list 'purpose-user-mode-purposes '(shell-mode . test))
(add-to-list 'purpose-user-mode-purposes '(magit-diff-mode . test))

;; Enumerate through all stuff.
;; Git things
(add-to-list 'purpose-user-regexp-purposes
             '("COMMIT_EDITMSG\\(<.*>\\)?$" . code))
(add-to-list 'purpose-user-regexp-purposes
             '("git-rebase-todo\\(<.*>\\)?$" . code))
(add-to-list 'purpose-user-mode-purposes '(diff-mode . code))

;; Programming files
(add-to-list 'purpose-user-mode-purposes '(ruby-mode . code))
(add-to-list 'purpose-user-mode-purposes '(elixir-mode . code))
(add-to-list 'purpose-user-mode-purposes '(rust-mode . code))
(add-to-list 'purpose-user-mode-purposes '(haskell-mode . code))
(add-to-list 'purpose-user-mode-purposes '(haskell-cabal-mode . code))
(add-to-list 'purpose-user-mode-purposes '(web-mode . code))
(add-to-list 'purpose-user-mode-purposes '(java-mode . code))
(add-to-list 'purpose-user-mode-purposes '(python-mode . code))
(add-to-list 'purpose-user-mode-purposes '(js-mode . code))
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . code))
(add-to-list 'purpose-user-mode-purposes '(sql-mode . code))
(add-to-list 'purpose-user-mode-purposes '(go-mode . code))

;; Other files that fall into 'code'
(add-to-list 'purpose-user-mode-purposes '(xml-mode . code))
(add-to-list 'purpose-user-mode-purposes '(markdown-mode . code))
(add-to-list 'purpose-user-mode-purposes '(terraform-mode . code))
(add-to-list 'purpose-user-mode-purposes '(yaml-mode . code))
(add-to-list 'purpose-user-mode-purposes '(dockerfile-mode . code))

;; Tools
(add-to-list 'purpose-user-mode-purposes '(dired-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(magit-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(help-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(helm-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(etags-select-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(reb-mode . tools)) ;; Regexp builder

(setq purpose-use-default-configuration nil)
(purpose-compile-user-configuration)

;; Functions for changing layout
(defun purpose-big-screen ()
  "Load coding_with_magit."
  (interactive)
  (purpose-load-window-layout "coding_with_magit"))

(defun purpose-small-screen ()
  "Load small_screen."
  (interactive)
  (purpose-load-window-layout "small_screen"))
;;; windows.el ends here
