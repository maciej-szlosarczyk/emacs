;;; gleam.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Gleam language support

;;; Code:

(require 'icejam-prog-mode)

(use-package gleam-mode
  :requires (tree-sitter-indent lsp column-enforce-mode)
  :straight '(:type git
              :host github
              :repo "gleam-lang/gleam-mode"
              :files ("gleam-mode.el" "tree-sitter-gleam")))

(defun icejam-lang-gleam/activate-gleam-mode ()
  "All things Gleam."
  (set-indent 2)
  (column-enforce-n 100)
  (lsp))

(add-hook 'gleam-mode-hook 'icejam-lang-gleam/activate-gleam-mode)

(provide 'icejam-lang-gleam)
;;; icejam-lang-gleam.el ends here
