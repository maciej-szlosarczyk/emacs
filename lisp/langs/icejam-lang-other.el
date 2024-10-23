;;; other.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Load other languages or syntaxes configuration that do not fit anywhere else.

;;; Code:

;; Infrastructure files
(use-package dockerfile-mode :ensure t :defer t)
(use-package docker :ensure t :defer t)
(use-package terraform-mode :ensure t :defer t)
(use-package ansible :ensure t :defer t)
(use-package nginx-mode :ensure t :defer t)
(use-package jenkinsfile-mode :ensure t :defer t)
(use-package lua-mode :ensure t :defer t)

;; Graphql schema definition files.
(use-package graphql-mode :ensure t :defer t
  :mode ("\\.graphqls\\'" . graphql-mode))

;; Yaml
(declare-function lsp "lsp-mode" nil)
(use-package yaml-mode :ensure t :defer t :requires (lsp))

(with-eval-after-load 'yaml-mode
  (defun icejam-lang-activate-yaml-mode ()
    "Activate yaml-mode."
    (lsp))

  (add-hook 'yaml-mode-hook 'icejam-lang-activate-yaml-mode))


;; Other text files
(use-package json-mode :ensure t :defer t)
(use-package git-modes
  :ensure t
  :defer t
  :hook ((gitignore-mode . whitespace-mode)
         (before-save . whitespace-cleanup)))

(provide 'icejam-lang-other)
;;; icejam-lang-other.el ends here
