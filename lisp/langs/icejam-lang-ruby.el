;;; ruby -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-projectile)

(use-package rspec-mode :straight t :defer t)
(use-package ruby-end :straight t :defer t)
(use-package rbs-mode :straight t :defer t)

(use-package enh-ruby-mode
  :requires (rspec-mode ruby-end lsp)
  :straight t
  :defer t)

(defun icejam/activate-ruby-mode ()
  "All things for ruby mode."
  (icejam/set-indent 2)

  ;; Disable reek syntax checking permanently
  (add-to-list (make-local-variable 'flycheck-disabled-checkers) 'ruby-reek 'ruby-rubocop)

  ;; Do not insert magic encoding comment at the begining of each file
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Start LSP
  (lsp)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
(add-hook 'enh-ruby-mode-hook 'icejam/activate-ruby-mode)
;; (add-hook 'enh-ruby-mode-hook 'lsp-deferred)

(provide 'icejam-lang-ruby)
;;; icejam-lang-ruby.el ends here
