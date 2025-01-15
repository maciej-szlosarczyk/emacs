;;; purescript.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Configuration for purescript.

;;; Code:
(require 'icejam-prog-mode)

(use-package purescript-mode :ensure t :defer t
  :after (lsp-mode lsp-ui))

(declare-function purescript-indentation-mode "purescript-mode")

(defun icejam-activate-purescript-mode ()
  "All things Purescript."
  (icejam-set-indent 2)
  (column-enforce-n 98)

  ;; Purescript indentation
  (purescript-indentation-mode t)

  ;; Capf override
  (icejam-set-lsp-capfs))

(add-hook 'purescript-mode-hook 'icejam-activate-purescript-mode)

(provide 'icejam-lang-purescript)
;;; icejam-lang-purescript.el ends here
