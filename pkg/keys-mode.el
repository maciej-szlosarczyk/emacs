;;; keys-mode.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; My global mode, to house my custom keys.

;;; Code:

(define-minor-mode +custom-keys-mode
  "Minor mode for all of my personal key bindings."
  :global t
  :keymap (make-sparse-keymap))

;; Globally enable my minor mode
(+custom-keys-mode)

;;; Helpful key bindings
(define-key +custom-keys-mode-map (kbd "C-c \\") 'split-window-right) ;; Split window to the right
(define-key +custom-keys-mode-map (kbd "C-c /") 'split-window-below) ;; Split window to the bottom

;; Move between windows key bindings
(define-key +custom-keys-mode-map (kbd "C-c <left>") 'windmove-left)
(define-key +custom-keys-mode-map (kbd "C-c <right>") 'windmove-right)
(define-key +custom-keys-mode-map (kbd "C-c <up>") 'windmove-up)
(define-key +custom-keys-mode-map (kbd "C-c <down>") 'windmove-down)

;; The same, but without using arrow keys
(define-key +custom-keys-mode-map (kbd "C-c [") 'windmove-left)
(define-key +custom-keys-mode-map (kbd "C-c ]") 'windmove-right)
(define-key +custom-keys-mode-map (kbd "C-c {") 'windmove-up)
(define-key +custom-keys-mode-map (kbd "C-c }") 'windmove-down)

;; Kill current buffer and window
(define-key +custom-keys-mode-map (kbd "C-c q") 'kill-buffer-and-window)

;; List buffers
(define-key +custom-keys-mode-map (kbd "C-c b") 'ibuffer)

;; Revert without asking
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(define-key +custom-keys-mode-map (kbd "C-c r") 'revert-buffer-no-confirm)

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(define-key +custom-keys-mode-map [home] 'beginning-of-line)
(define-key +custom-keys-mode-map [end] 'end-of-line)

(provide '+custom-pkg-keys-mode)
;;; keys-mode.el ends here
