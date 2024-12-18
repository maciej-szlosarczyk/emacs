;;; icejam-flycheck -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Use flycheck globally to check syntax and compile languages
(use-package flycheck :ensure t
  :custom ((flycheck-emacs-lisp-load-path 'inherit))
  :config
  (global-flycheck-mode t)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (unbind-key "C-c ! C-c" flycheck-mode-map)
  (unbind-key "C-c ! C-w" flycheck-mode-map)
  (unbind-key "C-c ! ?" flycheck-mode-map)
  (unbind-key "C-c ! C" flycheck-mode-map)
  (unbind-key "C-c ! H" flycheck-mode-map)
  (unbind-key "C-c ! V" flycheck-mode-map)
  (unbind-key "C-c ! c" flycheck-mode-map)
  (unbind-key "C-c ! e" flycheck-mode-map)
  (unbind-key "C-c ! h" flycheck-mode-map)
  (unbind-key "C-c ! i" flycheck-mode-map)
  (unbind-key "C-c ! l" flycheck-mode-map)
  (unbind-key "C-c ! n" flycheck-mode-map)
  (unbind-key "C-c ! p" flycheck-mode-map)
  (unbind-key "C-c ! s" flycheck-mode-map)
  (unbind-key "C-c ! v" flycheck-mode-map)
  (unbind-key "C-c ! x" flycheck-mode-map))

(provide 'icejam-flycheck)
;;; icejam-flycheck.el ends here
