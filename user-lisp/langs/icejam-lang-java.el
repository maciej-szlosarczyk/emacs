;;; java -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(add-to-list 'auto-mode-alist '("\\.java\\'" . java-ts-mode))

;; (use-package eglot-java :ensure t)

(defun icejam-activate-java-mode ()
	"Java mode overrides."
	(icejam-set-indent 2)
  (eglot-ensure)
  (column-enforce-n 80)
  (icejam-set-eglot-capfs))

;; (add-hook 'java-ts-mode-hook 'eglot-java-mode)
(add-hook 'java-ts-mode-hook 'icejam-activate-java-mode)

(provide 'icejam-lang-java)
;;; icejam-lang-java.el ends here
