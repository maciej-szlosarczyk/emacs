;;; other.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Load other languages or syntaxes configuration that do not fit anywhere else.

;;; Code:

;; Infrastructure files
(use-package dockerfile-mode :straight t :defer t)
(use-package terraform-mode :straight t :defer t)
(use-package ansible :straight t :defer t)
(use-package nginx-mode :straight t :defer t)
(use-package jenkinsfile-mode :straight t :defer t)

;; Text files
(use-package yaml-mode :straight t :defer t)
(use-package gitignore-mode
  :straight t
  :defer t
  :hook ((gitignore-mode . whitespace-mode)
         (before-save . whitespace-cleanup)))

(provide '+custom-lang-other)
;;; other.el ends here
