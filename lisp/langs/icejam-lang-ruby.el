;;; ruby -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(use-package rspec-mode :ensure t :defer t)
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
  (lsp)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'ruby-ts-mode-hook 'rspec-mode)
(add-hook 'ruby-ts-mode-hook 'ruby-end-mode)
(eval-after-load 'rspec-mode '(rspec-install-snippets))
(add-hook 'ruby-ts-mode-hook 'icejam-activate-ruby-mode)

(provide 'icejam-lang-ruby)
;;; icejam-lang-ruby.el ends here
