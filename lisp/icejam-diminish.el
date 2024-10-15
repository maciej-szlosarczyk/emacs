;;; icejam-diminish.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; diminish minor modes

;;; Code:
(use-package diminish :straight t)

(eval-after-load 'flyspell '(diminish 'flyspell-mode))
(eval-after-load 'projectile '(diminish 'projectile-mode))
(eval-after-load 'flycheck '(diminish 'flycheck-mode))
(eval-after-load 'rainbow-mode '(diminish 'rainbow-mode))
(eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
(eval-after-load 'company '(diminish 'company-mode))
(eval-after-load 'which-key '(diminish 'which-key-mode))
(eval-after-load 'eldoc '(diminish 'eldoc-mode))
(eval-after-load 'yasnippet '(diminish 'yas-minor-mode))
(eval-after-load 'whitespace '(diminish 'whitespace-mode))
(eval-after-load 'autorevert '(diminish 'auto-revert-mode))
(eval-after-load 'ivy '(diminish 'ivy-mode))
(eval-after-load 'gcmh '(diminish 'gcmh-mode))

(provide 'icejam-diminish)
;;; icejam-diminish.el ends here
