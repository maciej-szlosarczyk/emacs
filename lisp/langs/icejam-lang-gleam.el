;;; gleam.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Gleam language support

;;; Code:
(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function lsp 'lsp-mode)
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)

(use-package gleam-ts-mode :defer t :after (lsp)
  :ensure (:type git
                 :host github
                 :repo "gleam-lang/gleam-mode"
                 :files ("gleam-ts-mode.el")))

(add-to-list 'auto-mode-alist '("\\.gleam\\'" . gleam-ts-mode))

(defun icejam-lang-activate-gleam-mode ()
  "All things Gleam."
  (icejam-set-indent 2)
  (column-enforce-n 100)
  (lsp)
  (icejam-set-lsp-capfs))

(add-hook 'gleam-mode-hook 'icejam-lang-activate-gleam-mode)

(provide 'icejam-lang-gleam)
;;; icejam-lang-gleam.el ends here
