;;; kotlin.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; kotlin does a thing.

;;; Code:

(use-package kotlin-mode
	:defer t
	:ensure t)

(use-package gradle-mode
	:defer t
	:ensure t)

(defun icejam-activate-kotlin-mode ()
  "All things Kotlin."
  (icejam-set-indent 4)
  (column-enforce-n 100)
  (lsp)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'kotlin-mode-hook 'icejam-activate-kotlin-mode)

(provide 'icejam-lang-kotlin)
;;; icejam-lang-kotlin.el ends here
