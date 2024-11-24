;;; kotlin.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; kotlin does a thing.

;;; Code:
(require 'icejam-prog-mode)
(require 'icejam-blocking)

(use-package kotlin-ts-mode :ensure t)

(with-eval-after-load 'kotlin-ts-mode
  (add-to-list 'auto-mode-alist '("\\.kt\\'" . kotlin-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.kts\\'" . kotlin-ts-mode)))

(use-package gradle-mode
	:defer t
	:ensure t)

(defun icejam-activate-kotlin-mode ()
  "All things Kotlin."
  (icejam-set-indent 2)
  (column-enforce-n 100)
  (lsp))

(add-hook 'kotlin-ts-mode-hook 'icejam-activate-kotlin-mode)

(provide 'icejam-lang-kotlin)
;;; icejam-lang-kotlin.el ends here
