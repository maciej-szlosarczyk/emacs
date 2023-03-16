;;; fsharp.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")

(use-package fsharp-mode
  :requires (lsp-mode lsp-ui)
  :straight t
  :defer t)

(defun activate-fsharp-mode ()
  "Activate F# goodies."
  (set-indent 4)
  (column-enforce-n 100)
  (lsp-deferred)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'fsharp-mode-hook 'activate-fsharp-mode)

(provide '+custom-lang-fsharp)
;;; fsharp.el ends here
