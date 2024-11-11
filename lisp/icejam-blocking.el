;;; icejam-blocking.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:
;; These packages are foundational dependency and possibly can be blocking.
;;; Code:

(use-package transient :ensure t)
(use-package diminish :ensure t)
(use-package company :ensure t)

;; https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
;; This supposedly makes it faster.
(setenv "LSP_USE_PLISTS" "true")
(use-package lsp-mode :ensure t)

(elpaca-wait)

(provide 'icejam-blocking)
;;; icejam-blocking.el ends here
