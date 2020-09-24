;;; haskell.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Provides configuration for haskell files

;;; Code:

(require 'pkg/prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require 'pkg/flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require 'pkg/hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package haskell-mode
  :ensure t
  :defer t)

(use-package dante
  :ensure t
  :defer t
  :requires (haskell-mode))

(defun activate-haskell-mode ()
  "Run this in haskell-mode."
  (set-indent 2)
  (column-enforce-n 80)
  (dante-mode)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(dante-company company-yasnippet)))

(add-hook 'haskell-mode-hook 'activate-haskell-mode)

(provide 'languages/haskell)
;;; haskell.el ends here
