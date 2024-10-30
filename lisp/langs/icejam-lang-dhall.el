;;; dhall -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-lsp)

(use-package dhall-mode :ensure t :defer t :requires (lsp))

(defun icejam-lang-activate-dhall-mode ()
  "Reconfigure dhall mode for your own purposes."
  (lsp))

(add-hook 'dhall-mode-hook 'icejam-lang-activate-dhall-mode)
(add-hook 'dhall-mode-hook 'display-line-numbers-mode)

(provide 'icejam-lang-dhall)
;;; icejam-lang-dhall.el ends here
