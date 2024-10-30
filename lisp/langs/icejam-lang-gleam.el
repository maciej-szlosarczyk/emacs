;;; gleam.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Gleam language support

;;; Code:

(require 'icejam-prog-mode)

(use-package gleam-ts-mode
  :ensure (:type git
                 :host github
                 :repo "gleam-lang/gleam-mode"
                 :files ("gleam-ts-mode.el")))

(add-to-list 'auto-mode-alist '("\\.gleam\\'" . gleam-ts-mode))

(defun icejam-lang-activate-gleam-mode ()
  "All things Gleam."
  (icejam-set-indent 2)
  (column-enforce-n 100)
  (lsp))

(add-hook 'gleam-mode-hook 'icejam-lang-activate-gleam-mode)

(provide 'icejam-lang-gleam)
;;; icejam-lang-gleam.el ends here
