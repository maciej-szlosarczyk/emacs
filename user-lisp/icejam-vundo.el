;;; icejam-vundo.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Use more advanced undo options.

;;; Code:

;; Undo UI
(use-package vundo :ensure t :defer t
  :config
  ;; Keep 64 MB of undo data, we have enough RAM to do this.
  (setopt undo-limit (* 64 1024 1024)))

(provide 'icejam-vundo)
;;; icejam-vundo.el ends here
