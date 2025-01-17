;;; fsharp.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:

(declare-function lsp-deferred 'lsp-mode)
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function column-enforce-n 'column-enforce-mode)
(declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)

(use-package fsharp-mode
  :requires (lsp-mode lsp-ui)
  :ensure t
  :defer t)

(defun icejam-activate-fsharp-mode ()
  "Activate F# goodies."
  (icejam-set-indent 4)
  (column-enforce-n 100)
  (lsp-deferred)

  ;; Capf override
  (icejam-set-lsp-capfs))

(add-hook 'fsharp-mode-hook 'icejam-activate-fsharp-mode)

(provide 'icejam-lang-fsharp)
;;; icejam-lang-fsharp.el ends here
