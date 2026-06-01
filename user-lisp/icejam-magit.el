;;; icejam-magit.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(eval-when-compile
  (declare-function git-commit-setup-capf 'git-commit)
  (defvar git-commit-setup-hook)
  (defvar icejam-keys-mode-map)
  (defvar magit-blame-mode-map))

(use-package magit
  :ensure t
  :commands (magit-blame-quit)
  :defer t
  :bind
  (:map icejam-keys-mode-map
        ("<f5> c" . magit-checkout)
        ("<f5> b" . magit-blame-addition)
        ("<f5> g" . magit-status))
  (:map magit-blame-mode-map
        ("<f5> b" . 'magit-blame-quit))
  :config
  (setopt git-commit-setup-hook
          (remove #'git-commit-setup-capf git-commit-setup-hook)))

(provide 'icejam-magit)
;;; icejam-magit.el ends here
