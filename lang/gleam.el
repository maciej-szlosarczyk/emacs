;;; gleam.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Gleam language support

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require '+custom-pkg-transient "$HOME/.emacs.d/pkg/transient.el")

(use-package tree-sitter-indent :straight t)

(use-package gleam-mode
  :requires (tree-sitter-indent)
  :straight '(:type git
              :host github
              :repo "gleam-lang/gleam-mode"
              :files ("gleam-mode.el" "tree-sitter-gleam")))

(defun +custom-lang-gleam/activate-gleam-mode ()
  "All things Gleam."
  (set-indent 2)
  (column-enforce-n 100)
  (lsp))

(add-hook 'gleam-mode-hook '+custom-lang-gleam/activate-gleam-mode)

(provide '+custom-lang-gleam)
;;; gleam.el ends here
