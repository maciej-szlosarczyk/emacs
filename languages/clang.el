;;; clang.el --- summary
;;; Commentary:
;;; Code:

(defun activate-clang-mode ()
  "Goodies for editing c files."
  (set-indent 8)
  (column-enforce-n 100)

  (add-to-list (make-local-variable 'company-backends)
               '(company-etags company-yasnippet))

  (setq-local
   ctags/refresh-command
   (format
    "ctags -e -R --languages=C -f %sTAGS %s."
    (projectile-project-root) (projectile-project-root)
  )))

(add-hook 'c-mode 'activate-clang-mode)

(provide 'clang)
;;; clang.el ends here
