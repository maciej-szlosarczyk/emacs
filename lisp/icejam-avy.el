;;; icejam-avy.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Avy is a navigation manager.

;;; Code:
(use-package avy :straight t :defer t
  :config
  (setq avy-timeout-seconds 1)
  :bind (:map icejam-keys-mode-map
              ([(hyper j)] . avy-goto-char-timer)) ;; Jump to text.
  )

(provide 'icejam-avy)
;;; icejam-avy.el ends here
