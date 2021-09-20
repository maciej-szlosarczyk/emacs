;;; term.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Proper terminal in Emacs

;;; Code:
(require '+custom-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")

;; Create new terminal
(defun start-term ()
  "Start Eshell terminal session."
  (interactive)
  (eshell))

(define-key +custom-keys-mode-map (kbd "<f12>") 'start-term)

(provide '+custom-pkg-term)
;;; term.el ends here
