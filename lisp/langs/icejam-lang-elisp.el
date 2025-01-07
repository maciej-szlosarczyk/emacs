;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-blocking)
(require 'icejam-prog-mode)
(require 'icejam-transient)

;; ;; Dash is a package that creates terse and more natural to me functions to
;; ;; do basic things in Elisp.
(declare-function elpaca-installed-p "elpaca")
(unless (elpaca-installed-p 'dash)
  (use-package dash :ensure t :defer t))

;; ;; Adds pseudomodal editing for lisp.
(unless (elpaca-installed-p 'lispy)
  (use-package lispy :ensure t :defer t))

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

  (dash-fontify-mode t)
  (lispy-mode t)

  (setq-local completion-at-point-functions '(yasnippet-capf
                                              elisp-completion-at-point
                                              cape-dabbrev
                                              cape-file
                                              cape-elisp-symbol)))

(add-hook 'emacs-lisp-mode-hook 'icejam-activate-emacs-lisp-mode)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
