;;; sh -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package fish-mode :straight t :defer t)

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.envrc\\'" . sh-mode))

(provide 'icejam-lang-sh)
;;; icejam-lang-sh.el ends here
