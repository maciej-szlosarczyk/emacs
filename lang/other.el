;;; other.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Load other languages or syntaxes configuration that do not fit anywhere else.

;;; Code:

;; Infrastructure files
(use-package dockerfile-mode :straight t :defer t)
(use-package docker :straight t :defer t :ensure t)
(use-package terraform-mode :straight t :defer t)
(use-package ansible :straight t :defer t)
(use-package nginx-mode :straight t :defer t)
(use-package jenkinsfile-mode :straight t :defer t)
(use-package lua-mode :straight t :defer t)
(use-package graphql-mode :straight t :defer t)
(add-to-list 'auto-mode-alist '("\\.graphqls\\'" . graphql-mode))

;; Yaml
(use-package yaml-mode :straight t :defer t :requires (lsp))

(defun +custom-lang-yaml/activate-yaml-mode ()
  "Activate yaml-mode."
  (lsp))

(add-hook 'yaml-mode-hook '+custom-lang-yaml/activate-yaml-mode)

;; Other text files
(use-package json-mode :straight t :defer t)
(use-package git-modes
  :straight t
  :defer t
  :hook ((gitignore-mode . whitespace-mode)
         (before-save . whitespace-cleanup)))

(provide '+custom-lang-other)
;;; other.el ends here
