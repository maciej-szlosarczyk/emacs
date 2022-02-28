;;; ruby -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-projectile "$HOME/.emacs.d/pkg/projectile.el")
(require '+custom-pkg-ctags "$HOME/.emacs.d/pkg/ctags.el")

(use-package rspec-mode :straight t :defer t)
(use-package ruby-end :straight t :defer t)

(use-package enh-ruby-mode
  :requires (rspec-mode ruby-end)
  :straight t
  :defer t)

(defun activate-ruby-mode ()
  "All things for ruby mode."
  (set-indent 2)

  ;; Disable reek syntax checking permanently
  (add-to-list (make-local-variable 'flycheck-disabled-checkers) 'ruby-reek 'ruby-rubocop)

  ;; Do not insert magic encoding comment at the begining of each file
  (setq ruby-insert-encoding-magic-comment nil)

  (lsp)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
(add-hook 'enh-ruby-mode-hook 'activate-ruby-mode)

(provide '+custom-lang-ruby)
;;; ruby.el ends here
