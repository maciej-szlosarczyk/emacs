;;; icejam-flycheck -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Use flycheck globally to check syntax and compile languages
(use-package flymake-flycheck :ensure t :defer t :config
(setq-default
     flycheck-disabled-checkers
     (append (default-value 'flycheck-disabled-checkers)
             '(emacs-lisp emacs-lisp-checkdoc
                          emacs-lisp-package sh-shellcheck))))

(use-package flymake :ensure nil
  :config
  (setopt flymake-mode-line-lighter "Fly")                ;; Show 'Fly' in mode line
  (setopt elisp-flymake-byte-compile-load-path load-path) ;; Use the same load-path as normal configuration
  :hook ((prog-mode . flymake-mode)
         (text-mode . flymake-mode)
         (flymake-mode . flymake-flycheck-auto)))


;; (use-package flycheck :ensure t
;;   :custom ((flycheck-emacs-lisp-load-path 'inherit))
;;   :config
;;   (global-flycheck-mode t)
;;   (setopt flycheck-emacs-lisp-load-path 'inherit)
;;   (unbind-key "C-c ! C-c" flycheck-mode-map)
;;   (unbind-key "C-c ! C-w" flycheck-mode-map)
;;   (unbind-key "C-c ! ?" flycheck-mode-map)
;;   (unbind-key "C-c ! C" flycheck-mode-map)
;;   (unbind-key "C-c ! H" flycheck-mode-map)
;;   (unbind-key "C-c ! V" flycheck-mode-map)
;;   (unbind-key "C-c ! c" flycheck-mode-map)
;;   (unbind-key "C-c ! e" flycheck-mode-map)
;;   (unbind-key "C-c ! h" flycheck-mode-map)
;;   (unbind-key "C-c ! i" flycheck-mode-map)
;;   (unbind-key "C-c ! l" flycheck-mode-map)
;;   (unbind-key "C-c ! n" flycheck-mode-map)
;;   (unbind-key "C-c ! p" flycheck-mode-map)
;;   (unbind-key "C-c ! s" flycheck-mode-map)
;;   (unbind-key "C-c ! v" flycheck-mode-map)
;;   (unbind-key "C-c ! x" flycheck-mode-map))

(provide 'icejam-flycheck)
;;; icejam-flycheck.el ends here
