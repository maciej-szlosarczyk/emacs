;;; pkg/flycheck -- summary
;;; Commentary:
;;; Code:

;; Use flycheck globally to check syntax and compile languages
(use-package flycheck
  :commands flycheck-define-checker
  :ensure t
  :defer t
  :config (global-flycheck-mode t))

(provide 'pkg/flycheck)
;;; flycheck.el ends here
