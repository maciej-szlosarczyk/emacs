;;; icejam-avy.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Avy is a navigation manager.

;;; Code:
(require 'icejam-keys-mode)

(use-package avy :ensure t :defer t
  :custom (avy-timeout-seconds 1 "Wait for 1 second for candidates")
  :bind (:map icejam-keys-mode-map
              ;; Jump to text in sight with CMD-j
              ([(hyper j)] . avy-goto-char-timer)))

(provide 'icejam-avy)
;;; icejam-avy.el ends here
