;; Require Enhanced Ruby Mode

(use-package enh-ruby-mode
  :requires (rspec-mode ruby-end-mode)
  :ensure t
  :config
  (add-hook 'enh-ruby-mode-hook 'rspec-mode)
  (add-hook 'enh-ruby-mode-hook 'ruby-end-mode)
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))

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
              (format "ctags -e -R --languages=ruby -f %sTAGS %s. $(bundle list --paths)"
                      (projectile-project-root) (projectile-project-root))))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'activate-ruby-mode)

;;; ERB specific things
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("<%" "%>")
                   ("beg" "end")))
        ))
