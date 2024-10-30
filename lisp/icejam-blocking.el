;;; icejam-blocking.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:
;; These packages are foundational dependency and possibly can be blocking.
;;; Code:

(use-package transient :ensure (:wait t))
(use-package diminish :ensure (:wait t))
(use-package company :ensure (:wait t))

;; https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
;; This supposedly makes it faster.
(setenv "LSP_USE_PLISTS" "true")
(use-package lsp-mode :ensure (:wait t))

(provide 'icejam-blocking)
;;; icejam-blocking.el ends here
