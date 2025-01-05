;;; icejam-flycheck -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Use flycheck checks with flymake.
(use-package flymake-flycheck :ensure t :defer t :config
(setq-default
     flycheck-disabled-checkers
     (append (default-value 'flycheck-disabled-checkers)
             '(emacs-lisp emacs-lisp-checkdoc
                          emacs-lisp-package sh-shellcheck))))

;; Use flymake, the built in linter/checker.
(use-package flymake :ensure nil
  :defer t
  :config
  ;; Show 'Fly' in mode line.
  (setopt flymake-mode-line-lighter "Fly")
  ;; Use the same load-path as normal configuration. This makes the errors that
  ;; appear in elisp files less jarring.
  (setopt elisp-flymake-byte-compile-load-path load-path)
  :hook ((prog-mode . flymake-mode)
         (text-mode . flymake-mode)
         (flymake-mode . flymake-flycheck-auto)))

(provide 'icejam-flycheck)
;;; icejam-flycheck.el ends here
