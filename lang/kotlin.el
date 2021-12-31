;;; kotlin.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; kotlin does a thing.

;;; Code:

(use-package kotlin-mode
	:defer t
	:straight t)

(use-package gradle-mode
	:defer t
	:straight t)

(defun activate-kotlin-mode ()
  "All things Kotlin."
  (set-indent 4)
  (column-enforce-n 100)
  (lsp)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'kotlin-mode-hook 'activate-kotlin-mode)

(provide '+custom-lang-kotlin)
;;; kotlin.el ends here
