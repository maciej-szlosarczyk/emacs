;;; dart -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dart-mode :ensure t :defer t)

(defun icejam-lang-activate-dart-mode ()
  "Reconfigure dart mode for your own purposes."
  (eglot-ensure))

(add-hook 'dart-mode-hook 'icejam-lang-activate-dart-mode)

(provide 'icejam-lang-dart)
;;; icejam-lang-dart.el ends here
