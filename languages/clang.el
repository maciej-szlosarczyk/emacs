;;; languages/clang.el --- summary
;;; Commentary:
;;; Code:

(require 'pkg/projectile "$HOME/.emacs.d/pkg/projectile.el")
(require 'pkg/ctags "$HOME/.emacs.d/pkg/ctags.el")
(require 'pkg/prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(defun activate-clang-mode ()
  "Goodies for editing c files."

  ;; Set column width to 100
  (column-enforce-n 100)

  ;; Set indentation to 4 chars
  (if (boundp 'c-basic-offset)
      (setq-local c-basic-offset 4)
    (defvar c-basic-offset 4))

  (if (boundp 'c-default-style)
      (setq-local c-default-style "bsd")
    (defvar c-default-style "bsd"))

  (add-to-list (make-local-variable 'company-backends)
               '(company-etags company-yasnippet))

  (setq-local
   ctags/refresh-command
   (format
    "ctags -e -R --languages=C -f %sTAGS %s/*"
    (projectile-project-root) (projectile-project-root))))

(add-hook 'c-mode-hook 'activate-clang-mode)

(provide 'languages/clang)
;;; clang.el ends here
