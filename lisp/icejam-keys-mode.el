;;; icejam-keys-mode.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; My global mode, to house my custom keys.

;;; Code:

(define-minor-mode icejam-keys-mode
  "Minor mode for all of my personal key bindings."
  :global t
  :group 'icejam
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

;; Kill current buffer and window
(define-key icejam-keys-mode-map (kbd "C-c q") 'kill-buffer-and-window)

;; List buffers
(define-key icejam-keys-mode-map (kbd "C-c b") 'ibuffer)

;; Revert without asking
(defun icejam-revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(define-key icejam-keys-mode-map (kbd "C-c r") 'icejam-revert-buffer-no-confirm)

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(define-key icejam-keys-mode-map [home] 'beginning-of-line)
(define-key icejam-keys-mode-map [end] 'end-of-line)

;;;;;;;;; Translate keys ;;;;;;;;;;;;;;;;;;;;;
(define-key key-translation-map (kbd "<f6>") (kbd "C-c l")) ;; On F6, send C-c l
(define-key key-translation-map (kbd "<f7>") (kbd "C-c c")) ;; On F7, send C-c c
(define-key key-translation-map (kbd "<f8>") (kbd "C-c p")) ;; On F8, send C-c p

(provide 'icejam-keys-mode)
;;; icejam-keys-mode.el ends here
