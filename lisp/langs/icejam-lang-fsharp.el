;;; fsharp.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-lsp)

(use-package fsharp-mode
  :requires (lsp-mode lsp-ui)
  :ensure t
  :defer t)

(defun icejam-activate-fsharp-mode ()
  "Activate F# goodies."
  (icejam-set-indent 4)
  (column-enforce-n 100)
  (lsp-deferred)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'fsharp-mode-hook 'icejam-activate-fsharp-mode)

(provide 'icejam-lang-fsharp)
;;; icejam-lang-fsharp.el ends here
