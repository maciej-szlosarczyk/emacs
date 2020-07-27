;;; other.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Load other languages or syntaxes configuration that do not fit anywhere else.

;;; Code:

;; Infrastructure files
(use-package dockerfile-mode :ensure t :defer t)
(use-package terraform-mode :ensure t :defer t)
(use-package ansible :ensure t :defer t)
(use-package nginx-mode :ensure t :defer t)

;; Text files
(use-package yaml-mode :ensure t :defer t)
(use-package gitignore-mode
  :ensure t
  :defer t
  :hook ((gitignore-mode . whitespace-mode)
         (before-save . whitespace-cleanup)))

(provide 'languages/other)
;;; other.el ends here
