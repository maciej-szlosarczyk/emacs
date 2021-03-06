;;; pkg/deft.el -- summary
;;; Commentary:
;;; Notational velocity, backed by OneDrive.
;;; Code:

(require 'icejam-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")

(use-package deft
  :straight t
  :defer t
  :config (setq
           deft-directory (substitute-in-file-name "$HOME/OneDrive/deft")
           deft-default-extension "md"
           deft-auto-save-interval 30.0))

(define-key icejam-keys-mode-map (kbd "C-c d d") 'deft)

(provide 'icejam-pkg-deft)
;;; deft.el ends here
