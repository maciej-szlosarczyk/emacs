;;; 05deft.el -- summary
;;; Commentary:
;;; Notational velocity, backed by OneDrive.
;;; Code:

(use-package deft
  :ensure t
  :defer t
  :config (setq
           deft-directory (substitute-in-file-name "$HOME/OneDrive/deft")
           deft-default-extension "md"
           deft-auto-save-interval 30.0))

(global-set-key (kbd "C-c d d") 'deft)

(provide '05deft)
;;; 05deft.el ends here
