;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function icejam-set-elisp-capfs 'icejam-complete-at-point)
(declare-function icejam-set-indent 'icejam-prog-mode)

(add-to-list 'auto-mode-alist '("/Eask\\'" . emacs-lisp-mode))

(use-package lispy :ensure t :defer t :commands (lispy-mode))

(defun icejam-activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."

  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80) ;; Use 80 char limit.
  (lispy-mode t)        ;; Modal editing for Lisp
  (icejam-set-elisp-capfs))

(add-hook 'emacs-lisp-mode-hook 'icejam-activate-emacs-lisp-mode)
(add-hook 'ielm-mode-hook 'icejam-set-elisp-capfs)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
