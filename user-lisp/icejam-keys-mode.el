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

(defun icejam-revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

;; Splitting window
(keymap-set icejam-keys-mode-map "C-c \\" #'split-window-right)
(keymap-set icejam-keys-mode-map "C-c /" #'split-window-below)
(keymap-set icejam-keys-mode-map "C-c \"" #'split-window-right)
(keymap-set icejam-keys-mode-map "C-c %" #'split-window-below)
(keymap-set icejam-keys-mode-map "C-c '" #'split-window-right)
(keymap-set icejam-keys-mode-map "C-c 5" #'split-window-below)

;; Move between windows
(keymap-set icejam-keys-mode-map "C-c <left>" #'windmove-left)
(keymap-set icejam-keys-mode-map "C-c <right>" #'windmove-right)
(keymap-set icejam-keys-mode-map "C-c <up>" #'windmove-up)
(keymap-set icejam-keys-mode-map "C-c <down>" #'windmove-down)

;; History of buffers
(keymap-set icejam-keys-mode-map "C-c s [" #'previous-buffer)
(keymap-set icejam-keys-mode-map "C-c s ]" #'next-buffer)

;; These are slightly more conveniently located on an Ergodox/Moonlander
(keymap-set icejam-keys-mode-map "C-c s <left>" #'previous-buffer)
(keymap-set icejam-keys-mode-map "C-c s <right>" #'next-buffer)

;; List of buffers buffer
(keymap-set icejam-keys-mode-map "C-c b" #'ibuffer)

;; Manipulate buffers (kill or revert)
(keymap-set icejam-keys-mode-map "C-c q" #'kill-buffer-and-window)
(keymap-set icejam-keys-mode-map "C-c r" #'icejam-revert-buffer-no-confirm)

;; Make emacs behave like a normal editor from 21st century.
(keymap-set icejam-keys-mode-map "<home>" #'beginning-of-line)
(keymap-set icejam-keys-mode-map "<end>" #'end-of-line)

;;;;;;;;; Translate keys ;;;;;;;;;;;;;;;;;;;;;
(keymap-set key-translation-map "<f6>" "C-c l") ;; On F6, send C-c l
(keymap-set key-translation-map "<f7>" "C-c c") ;; On F7, send C-c c
(keymap-set key-translation-map "<f8>" "C-c p") ;; On F8, send C-c p

(provide 'icejam-keys-mode)
;;; icejam-keys-mode.el ends here
