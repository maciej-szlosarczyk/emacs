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

(evil-leader/set-key "Ps" 'helm-projectile-switch-project)
(evil-leader/set-key "t"  'helm-projectile-find-file)
(evil-leader/set-key "ag" 'helm-projectile-ag)
(evil-leader/set-key "Pc" 'projectile-invalidate-cache)
(evil-leader/set-key "b"  'helm-buffers-list)

(evil-leader/set-key "<SPC>" 'company-yasnippet)
(evil-leader/set-key "rC" 'load-file "~/.emacs")

(evil-leader/set-key "Jl" 'dumb-jump-go); Jump to declaration
(evil-leader/set-key "Jh" 'dumb-jump-back); Jump back from declariation

(evil-leader/set-key "nt" 'neotree-toggle)

;;; VIM insert mode things
(define-key evil-insert-state-map "\C-a" 'company-yasnippet)

;;; Neotree conflict resolution
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;;; key-bindings.el ends here
