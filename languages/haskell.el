;;; haskell.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; haskell does a thing.

;;; Code:

(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")
(require '05flycheck "$HOME/.emacs.d/05flycheck.el")
(require '05hydra "$HOME/.emacs.d/05hydra.el")

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

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(dante-company company-yasnippet)))

(add-hook 'haskell-mode-hook 'dante-mode)
(add-hook 'haskell-mode-hook 'activate-haskell-mode)

(provide 'languages/haskell)
;;; haskell.el ends here
