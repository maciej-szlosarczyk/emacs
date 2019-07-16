;; Use flycheck globally to check syntax and compile languages
(use-package flycheck
  :commands flycheck-define-checker
  :ensure t
  :defer t
  :config (global-flycheck-mode t))
