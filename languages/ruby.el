;;; ruby -- summary
;;; Commentary:
;;; Code:

(use-package rspec-mode :ensure t :defer t)
(use-package ruby-end :ensure t :defer t)

(use-package enh-ruby-mode
  :requires (rspec-mode ruby-end)
  :ensure t
  :defer t)

(defun activate-ruby-mode ()
  "All things for ruby mode."
  (set-indent 2)

  ;; Set column enforcement at 80 for normal projects, and at 100 for work
  (if (string-match-p "internetee" (buffer-file-name))
      (column-enforce-n 100)
    (column-enforce-n 80))

  ;; Disable reek syntax checking permanently
  (add-to-list (make-local-variable 'flycheck-disabled-checkers) 'ruby-reek)

  ;; Do not insert magic encoding comment at the begining of each file
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-etags company-yasnippet))

  ;; Set specific ctags command
  (setq-local ctags/refresh-command
              (format "uctags -e -R --languages=ruby -f %sTAGS %s. $(bundle list --paths)"
                      (projectile-project-root) (projectile-project-root))))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
(add-hook 'enh-ruby-mode-hook 'activate-ruby-mode)

(provide 'ruby)
;;; ruby.el ends here
