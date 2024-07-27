;;; languages/clang.el --- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(defun icejam-lang-clang/activate-clang-mode ()
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
               '(company-etags company-yasnippet)))

(add-hook 'c-mode-hook 'icejam-lang-clang/activate-clang-mode)

(provide 'icejam-lang-clang)
;;; icejam-lang-clang.el ends here
