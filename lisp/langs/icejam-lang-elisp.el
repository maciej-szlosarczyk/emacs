;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-transient)

;; Dash is a package that creates terse and more natural to me functions to
;; do basic things in Elisp.
(use-package dash :ensure t :defer t)
(use-package lispy :ensure t :defer t)
(use-package aggressive-indent :ensure t :defer t)

(declare-function aggressive-indent-mode "aggressive-indent")
(declare-function column-enforce-n "column-enforce-mode" (number))
(add-to-list 'auto-mode-alist '("/Eask\\'" . emacs-lisp-mode))

(transient-define-prefix icejam-elisp-lang-menu ()
  "Elisp Buffer Commands."
  [""
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("d" "Explain"     helpful-at-point)
    ("e" "Show Errors" flymake-show-buffer-diagnostics)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(add-to-list
 'icejam-language-transient-alist '(emacs-lisp-mode . icejam-elisp-lang-menu))

(declare-function lispy-mode "lispy")
(defun icejam-activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."
  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)

  (dash-fontify-mode t)    ;; Fontify dash variables
  (lispy-mode t)           ;; Pseudomodal editing for lisp code
  (aggressive-indent-mode) ;; Indent lisp automatically

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-capf)))

(add-hook 'emacs-lisp-mode-hook 'icejam-activate-emacs-lisp-mode)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
