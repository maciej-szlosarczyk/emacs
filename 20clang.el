(defun activate-clang-mode ()
  "Goodies for editing c files"
  (set-indent 4)
  (column-enforce-n 80)

  (add-to-list (make-local-variable 'company-backends)
               '(company-etags company-yasnippet))

  (setq-local
   ctags-refresh-command
   (format
    "ctags -e -R --languages=C -f %sTAGS %s."
    (projectile-project-root) (projectile-project-root)
  )))

(add-hook 'c-mode-hook 'activate-clang-mode)
