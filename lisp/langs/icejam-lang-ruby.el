;;; ruby -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
(eval-when-compile (defvar icejam-language-transient-alist))

(use-package rspec-mode :ensure t :defer t :commands (rspec-install-snippets))
(use-package ruby-end :ensure t :defer t)
(use-package rbs-mode :ensure t :defer t)

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-ts-mode))

(defun icejam-activate-ruby-mode ()
  "All things for ruby mode."
  (icejam-set-indent 2)

  ;; Disable reek syntax checking permanently
  (add-to-list (make-local-variable 'flycheck-disabled-checkers) 'ruby-reek 'ruby-rubocop)

  ;; Do not insert magic encoding comment at the begining of each file
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Start LSP
  (eglot-ensure)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'ruby-ts-mode-hook 'rspec-mode)
(add-hook 'ruby-ts-mode-hook 'ruby-end-mode)
(eval-after-load 'rspec-mode '(rspec-install-snippets))
(add-hook 'ruby-ts-mode-hook 'icejam-activate-ruby-mode)

(provide 'icejam-lang-ruby)
;;; icejam-lang-ruby.el ends here
