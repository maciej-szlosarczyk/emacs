;;; languages/clang.el --- summary
;;; Commentary:
;;; Code:

(require '05projectile "$HOME/.emacs.d/05projectile.el")
(require '05ctags "$HOME/.emacs.d/05ctags.el")
(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")

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

(provide 'languages/clang)
;;; clang.el ends here
