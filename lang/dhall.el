;;; dhall -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(use-package dhall-mode :straight t :defer t)

(defun +custom-lang-dhall/activate-dhall-mode ()
  "Reconfigure dhall mode for your own purposes."
  (lsp))

(add-hook 'dhall-mode-hook '+custom-lang-dhall/activate-dhall-mode)
(add-hook 'dhall-mode-hook 'display-line-numbers-mode)

(provide '+custom-lang-dhall)
;;; dhall.el ends here
