;;; dart -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(use-package dart-mode :straight t :defer t)
(use-package lsp-dart :defer t :straight t)

(defun +custom-lang-dart/activate-dart-mode ()
  "Reconfigure dart mode for your own purposes."
  (lsp))

(add-hook 'dart-mode-hook '+custom-lang-dart/activate-dart-mode)

(provide '+custom-lang-dart)
;;; dart.el ends here
