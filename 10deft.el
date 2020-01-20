;; Notational velocity things
(use-package deft
  :ensure t
  :defer t
  :config (setq deft-directory
                (substitute-in-file-name "$HOME/OneDrive/deft")))

(global-set-key (kbd "C-c d d") 'deft)
