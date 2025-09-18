;;; haskell.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Provides configuration for haskell files

;;; Code:

(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)

(use-package haskell-mode :ensure t :defer t)

(defun icejam-activate-haskell-mode ()
  "Run this in `haskell-mode'."
  (icejam-set-indent 2)
  (column-enforce-n 80)
  (eglot-ensure)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'haskell-mode-hook 'icejam-activate-haskell-mode)

(provide 'icejam-lang-haskell)
;;; icejam-lang-haskell.el ends here
