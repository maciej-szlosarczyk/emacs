;;; purescript.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; purescript does a thing.

;;; Code:
(use-package purescript-mode
  :requires (lsp-mode lsp-ui)
  :straight t)

(defun icejam/activate-purescript-mode ()
  "All things Purescript."
  (icejam/set-indent 2)
  (column-enforce-n 98)

  ;; Purescript indentation
  (purescript-indentation-mode t)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'purescript-mode-hook 'icejam/activate-purescript-mode)

(provide 'icejam-lang-purescript)
;;; icejam-lang-purescript.el ends here
