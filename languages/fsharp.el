;;; fsharp.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:

(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")
(require '05flycheck "$HOME/.emacs.d/05flycheck.el")

(use-package fsharp-mode
  :requires (lsp-mode lsp-ui)
  :ensure t
  :defer t)

(defun activate-fsharp-mode ()
  "Activate F# goodies."
  (set-indent 4)
  (column-enforce-n 100)
  (lsp-deferred))

(add-hook 'fsharp-mode-hook 'activate-fsharp-mode)

(provide 'languages/fsharp)
;;; fsharp.el ends here
