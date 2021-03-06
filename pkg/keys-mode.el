;;; keys-mode.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; My global mode, to house my custom keys.

;;; Code:

(define-minor-mode icejam-keys-mode
  "Minor mode for all of my personal key bindings"
  :global t
  :keymap (make-sparse-keymap))

;; Globally enable my minor mode
(icejam-keys-mode)

;;; Helpful key bindings
(define-key icejam-keys-mode-map (kbd "C-c \\") 'split-window-right) ;; Split window to the right
(define-key icejam-keys-mode-map (kbd "C-c /") 'split-window-below) ;; Split window to the bottom

;; Move between windows key bindings
(define-key icejam-keys-mode-map (kbd "C-c <left>") 'windmove-left)
(define-key icejam-keys-mode-map (kbd "C-c <right>") 'windmove-right)
(define-key icejam-keys-mode-map (kbd "C-c <up>") 'windmove-up)
(define-key icejam-keys-mode-map (kbd "C-c <down>") 'windmove-down)

;; The same, but without using arrow keys
(define-key icejam-keys-mode-map (kbd "C-c [") 'windmove-left)
(define-key icejam-keys-mode-map (kbd "C-c ]") 'windmove-right)
(define-key icejam-keys-mode-map (kbd "C-c {") 'windmove-up)
(define-key icejam-keys-mode-map (kbd "C-c }") 'windmove-down)

;; Switch to previous and next buffer
(define-key icejam-keys-mode-map (kbd "C-c s <left>") 'previous-buffer)
(define-key icejam-keys-mode-map (kbd "C-c s <right>") 'next-buffer)

;; The same, but without arrow keys.
(define-key icejam-keys-mode-map (kbd "C-c s [") 'previous-buffer)
(define-key icejam-keys-mode-map (kbd "C-c s ]") 'next-buffer)


;; Kill current buffer and window
(define-key icejam-keys-mode-map (kbd "C-c q") 'kill-buffer-and-window)

;; List buffers
(define-key icejam-keys-mode-map (kbd "C-c b") 'ibuffer)

;; Create new terminal
(defun start-zsh-term ()
  "Start ZSH terminal session."
  (ansi-term "/bin/zsh" "Zsh"))
(define-key icejam-keys-mode-map (kbd "<f12>") 'start-zsh-term)

;; Revert without asking
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(define-key icejam-keys-mode-map (kbd "C-c r") 'revert-buffer-no-confirm)

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(define-key icejam-keys-mode-map [home] 'beginning-of-line)
(define-key icejam-keys-mode-map [end] 'end-of-line)

(provide 'icejam-pkg-keys-mode)
;;; keys-mode.el ends here
