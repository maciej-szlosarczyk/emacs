;;; fsharp.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:

(require 'pkg/prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require 'pkg/flycheck "$HOME/.emacs.d/pkg/flycheck.el")

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
