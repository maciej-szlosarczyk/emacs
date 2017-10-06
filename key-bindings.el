;;; keybindings.el -- Summary
;;; Commentary:
;;; Code:
;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "RET") 'newline)

;;;;;;;;; Mac binding (fix) ;;;;;;;;;;;;;;;;;;
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<up>") 'scroll-down) ; WTF is this reverse, I dunno
(global-set-key (kbd "s-<down>") 'scroll-up)

(require 'evil-leader)
;;;;;;;;; EVIL Leader ;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "w"  'kill-buffer
  ","  'previous-buffer
  "."  'next-buffer
  "k"  'kill-buffer-and-window
  "rb" 'revert-buffer) ; Reload current file from disk

(evil-leader/set-key "hs" 'split-window-below)
(evil-leader/set-key "vs" 'split-window-right)

(evil-leader/set-key
  "gk" 'windmove-up
  "gj" 'windmove-down
  "gl" 'windmove-right
  "gh" 'windmove-left)

(evil-leader/set-key
  "gs"  'magit-status
  "gL"  'magit-log
  "gco" 'magit-checkout)

(evil-leader/set-key "al" 'align-regexp)
(evil-leader/set-key "ir" 'indent-region)
(evil-leader/set-key "ac" 'align-to-colon)
(evil-leader/set-key "cl" 'evilnc-comment-or-uncomment-lines)

(evil-leader/set-key "ps" 'helm-projectile-switch-project)
(evil-leader/set-key "t"  'helm-projectile-find-file)
(evil-leader/set-key "pa" 'helm-projectile-ag)
(evil-leader/set-key "pc" 'projectile-invalidate-cache)
(evil-leader/set-key "b"  'helm-buffers-list)

(evil-leader/set-key "j;" 'dumb-jump-go); Jump to declaration
(evil-leader/set-key "jh" 'dumb-jump-back); Jump back from declaration

;; Dash integration
(require 'dash-at-point)
(evil-leader/set-key "d" 'dash-at-point)

(require 'evil)
;;; VIM insert mode state
(define-key evil-insert-state-map "\C-a" 'company-complete)
(define-key evil-insert-state-map "\C-q" 'company-yasnippet)


;;; The things below are experimental, need to be fixed
(define-key evil-insert-state-map "\M-." 'find-tag)
(define-key evil-insert-state-map "\M-*" 'pop-tag-mark)

;;; VIM browse mode things
(define-key evil-motion-state-map "\M-." 'find-tag)
(define-key evil-motion-state-map "\M-*" 'pop-tag-mark)
;;; key-bindings.el ends here
