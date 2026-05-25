;;; sh -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package fish-mode :ensure t :defer t)

(dolist
    (ending '("\\.zsh\\'" "\\.zshrc\\'" "\\.envrc\\'" "\\.zshrc\\'"))
  (add-to-list 'auto-mode-alist (cons ending 'sh-mode)))

(provide 'icejam-lang-sh)
;;; icejam-lang-sh.el ends here
