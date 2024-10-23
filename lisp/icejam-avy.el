;;; icejam-avy.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Avy is a navigation manager.

;;; Code:
(require 'icejam-keys-mode)

(use-package avy :ensure t)
(with-eval-after-load 'avy
  (setq avy-timeout-seconds 1)
  ;; Jump to text in sight with CMD-j
  (define-key icejam-keys-mode-map [(hyper j)] 'avy-goto-char-timer))

(provide 'icejam-avy)
;;; icejam-avy.el ends here
