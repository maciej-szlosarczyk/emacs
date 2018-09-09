;;; windows.el -- summary
;;; Commentary:
;;; Windows management things, mostly with purpose
;;; Code:
(require 'window-purpose)
(purpose-mode t)

;; Set everything to use code windows
(add-to-list 'purpose-user-mode-purposes '(fundamental-mode . code))
(add-to-list 'purpose-user-mode-purposes '(prog-mode . code))
(add-to-list 'purpose-user-mode-purposes '(diff-mode . code))
(add-to-list 'purpose-user-mode-purposes '(magit-diff-mode . code))
(add-to-list 'purpose-user-regexp-purposes
             '("COMMIT_EDITMSG\\(<.*>\\)?$" . code))
(add-to-list 'purpose-user-regexp-purposes
             '("git-rebase-todo\\(<.*>\\)?$" . code))


;; Tools
(add-to-list 'purpose-user-mode-purposes '(dired-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(process-list . tools))
(add-to-list 'purpose-user-mode-purposes '(magit-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(help-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(term-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(etags-select-mode . tools))
(add-to-list 'purpose-user-mode-purposes '(reb-mode . tools)) ;; Regexp builder
(add-to-list 'purpose-user-regexp-purposes
             '("Process List\\(<.*>\\)?$" . tools))

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

(global-set-key (kbd "<f8>") 'purpose-big-screen)
(global-set-key (kbd "<f7>") 'purpose-small-screen)
