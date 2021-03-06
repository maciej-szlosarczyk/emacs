;;; undo-tree.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Use more advanced undo options.

;;; Code:

;;;;;;;;;;;;;;;;; Use more advanced undo options
(use-package undo-tree
  :defer t
  :straight t
  :config (setq-default
           ;; Show diff
           undo-tree-visualizer-diff t
           ;; Show timestamps
           undo-tree-visualizer-timestamps t))

(global-undo-tree-mode t)

(provide 'icejam-pkg-undo-tree)
;;; undo-tree.el ends here
