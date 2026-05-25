;;; purescript.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Configuration for purescript.

;;; Code:

(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function purescript-indentation-mode 'purescript-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(use-package purescript-mode :ensure t :defer t)

(defun icejam-activate-purescript-mode ()
  "All things Purescript."
  (icejam-set-indent 2)
  (column-enforce-n 98)

  ;; Purescript indentation
  (purescript-indentation-mode t)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'purescript-mode-hook 'icejam-activate-purescript-mode)

(provide 'icejam-lang-purescript)
;;; icejam-lang-purescript.el ends here
