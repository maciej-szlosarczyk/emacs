;;; icejam-lang-golang.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; golang mode stuff

;;; Code:
(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)

(use-package go-mode :defer t :ensure t)

(defun icejam-activate-golang-mode ()
  "Activate my own Golang mode settings."
  (icejam-set-indent 8)
  (column-enforce-n 100)
  (eglot-ensure)
  (icejam-set-eglot-capfs))

(add-hook 'go-mode-hook #'icejam-activate-golang-mode)

(provide 'icejam-lang-golang)
;;; icejam-lang-golang.el ends here
