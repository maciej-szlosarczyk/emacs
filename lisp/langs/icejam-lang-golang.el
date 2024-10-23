;;; icejam-lang-golang.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; golang mode stuff

;;; Code:

(require 'icejam-prog-mode)

(use-package go-mode
  :requires (lsp-mode lsp-ui)
  :defer t
  :ensure t)

(defun icejam-activate-golang-mode ()
  "Activate my own Golang mode settings."
  (icejam-set-indent 8)
  (column-enforce-n 100)
  (lsp))

(add-hook 'go-mode-hook 'icejam-activate-golang-mode)

(provide 'icejam-lang-golang)
;;; icejam-lang-golang.el ends here
