;;; dart -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(use-package dart-mode :straight t :defer t)
(use-package lsp-dart :defer t :straight t :requires (dart-mode lsp))

(defun icejam-lang/activate-dart-mode ()
  "Reconfigure dart mode for your own purposes."
  (lsp))

(add-hook 'dart-mode-hook 'icejam-lang/activate-dart-mode)

(provide 'icejam-lang-dart)
;;; icejam-lang-dart.el ends here
