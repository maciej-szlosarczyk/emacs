;;; icejam-diminish.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; diminish minor modes

;;; Code:
(require 'icejam-blocking)
;; (use-package diminish :ensure t)

(with-eval-after-load 'diminish
  (with-eval-after-load 'flyspell (diminish 'flyspell-mode))
  (with-eval-after-load 'flycheck (diminish 'flycheck-mode))
  (with-eval-after-load 'rainbow-mode (diminish 'rainbow-mode))
  (with-eval-after-load 'undo-tree (diminish 'undo-tree-mode))
  (with-eval-after-load 'company (diminish 'company-mode))
  (with-eval-after-load 'which-key (diminish 'which-key-mode))
  (with-eval-after-load 'eldoc (diminish 'eldoc-mode))
  (with-eval-after-load 'yasnippet (diminish 'yas-minor-mode))
  (with-eval-after-load 'whitespace (diminish 'whitespace-mode))
  (with-eval-after-load 'autorevert (diminish 'auto-revert-mode))
  (with-eval-after-load 'ivy (diminish 'ivy-mode))
  (with-eval-after-load 'company-box (diminish 'company-box-mode))
  (with-eval-after-load 'smerge-mode (diminish 'smerge-mode))
  (with-eval-after-load 'gcmh (diminish 'gcmh-mode)))

(provide 'icejam-diminish)
;;; icejam-diminish.el ends here
