;;; gleam.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Gleam language support

;;; Code:
(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(use-package gleam-ts-mode :defer t :ensure t :mode (rx ".gleam" eos))

;; (add-to-list 'auto-mode-alist '("\\.gleam\\'" . gleam-ts-mode))

(defun icejam-lang-activate-gleam-mode ()
  "All things Gleam."
  (icejam-set-indent 2)
  (column-enforce-n 100)
  (icejam-start-eglot)
  (icejam-set-eglot-capfs))

(add-hook 'gleam-ts-mode-hook 'icejam-lang-activate-gleam-mode)

(provide 'icejam-lang-gleam)
;;; icejam-lang-gleam.el ends here
