;;; dhall -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dhall-mode :ensure t :defer t)

(eval-when-compile
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(defun icejam-lang-activate-dhall-mode ()
  "Reconfigure dhall mode for your own purposes."
  (eglot-ensure)
  (icejam-set-eglot-capfs))

(add-hook 'dhall-mode-hook 'icejam-lang-activate-dhall-mode)
(add-hook 'dhall-mode-hook 'display-line-numbers-mode)

(provide 'icejam-lang-dhall)
;;; icejam-lang-dhall.el ends here
