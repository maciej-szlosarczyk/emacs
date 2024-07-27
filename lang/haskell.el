;;; haskell.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Provides configuration for haskell files

;;; Code:

(require 'icejam-prog-mode)

(use-package haskell-mode
  :straight t
  :defer t)

(use-package lsp-haskell
  :straight t
  :defer t
  :requires (lsp-mode lsp-ui haskell-mode))

(defun activate-haskell-mode ()
  "Run this in haskell-mode."
  (set-indent 2)
  (column-enforce-n 80)
  (lsp-deferred)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'haskell-mode-hook 'activate-haskell-mode)

(provide '+custom-lang-haskell)
;;; haskell.el ends here
