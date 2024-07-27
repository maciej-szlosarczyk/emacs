;;; dart -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(use-package dart-mode :straight t :defer t)
(use-package lsp-dart :defer t :straight t :requires (dart-mode lsp))

(defun +custom-lang-dart/activate-dart-mode ()
  "Reconfigure dart mode for your own purposes."
  (lsp))

(add-hook 'dart-mode-hook '+custom-lang-dart/activate-dart-mode)

(provide '+custom-lang-dart)
;;; dart.el ends here
