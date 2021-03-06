;;; term.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Proper terminal in Emacs

;;; Code:
(require 'icejam-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")

(use-package vterm :straight t :defer t)

;; Create new terminal
(defun start-term ()
  "Start ZSH terminal session."
  (interactive)
  (vterm))

(define-key icejam-keys-mode-map (kbd "<f12>") 'start-term)

(provide 'icejam-pkg-term)
;;; term.el ends here
