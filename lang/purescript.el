;;; purescript.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; purescript does a thing.

;;; Code:
(use-package purescript-mode
  :requires (lsp-mode lsp-ui)
  :ensure t)

(defun activate-purescript-mode ()
  "All things Purescript."
  (set-indent 2)
  (column-enforce-n 98)

  ;; Purescript indentation
  (purescript-indentation-mode t)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'purescript-mode-hook 'activate-purescript-mode)

(provide 'icejam-lang-purescript)
;;; purescript.el ends here
