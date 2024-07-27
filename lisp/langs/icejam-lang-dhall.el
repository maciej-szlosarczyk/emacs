;;; dhall -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(use-package dhall-mode :straight t :defer t :requires (lsp))

(defun +custom-lang-dhall/activate-dhall-mode ()
  "Reconfigure dhall mode for your own purposes."
  (lsp))

(add-hook 'dhall-mode-hook '+custom-lang-dhall/activate-dhall-mode)
(add-hook 'dhall-mode-hook 'display-line-numbers-mode)

(provide 'icejam-lang-dhall)
;;; icejam-lang-dhall.el ends here
