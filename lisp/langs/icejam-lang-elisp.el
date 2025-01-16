;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 'icejam-prog-mode)
(require 'icejam-transient)

(declare-function column-enforce-n "column-enforce-mode" (number))
(add-to-list 'auto-mode-alist '("/Eask\\'" . emacs-lisp-mode))

(use-package lispy :ensure t :defer t)

(defun icejam-activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."

  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80) ;; Use 80 char limit.
  (lispy-mode t)        ;; Modal editing for Lisp

  (setq-local completion-at-point-functions
              (list (cape-capf-super #'elisp-completion-at-point
                                     #'yasnippet-capf)
                    #'cape-dabbrev
                    #'cape-file
                    #'cape-elisp-symbol)))

(add-hook 'emacs-lisp-mode-hook 'icejam-activate-emacs-lisp-mode)
(add-hook 'ielm-mode-hook 'icejam-set-elisp-capfs)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
