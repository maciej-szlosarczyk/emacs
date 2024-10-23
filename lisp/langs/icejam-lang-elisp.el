;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-transient)

(use-package lispy :ensure (:wait t) :defer t)

(declare-function column-enforce-n "column-enforce-mode" (number))
(add-to-list 'auto-mode-alist '("/Eask\\'" . emacs-lisp-mode))

(transient-define-prefix icejam-elisp-lang-menu ()
  "Elisp Buffer Commands."
  [""
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("d" "Explain"     helpful-at-point)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(add-to-list
 'icejam-language-transient-alist '(emacs-lisp-mode . icejam-elisp-lang-menu))

(defun icejam-activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."
  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (lispy-mode)
  (setq-default indent-tabs-mode nil)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-capf)))

(add-hook 'emacs-lisp-mode-hook 'icejam-activate-emacs-lisp-mode)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
