;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 'icejam-prog-mode)
(require 'icejam-transient)

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

(defun icejam-activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."

  ;; Default indentation of 2 characters
  (icejam-set-indent 2)

  ;; Use 80 char limit.
  (column-enforce-n 80)

  ;; Parents
  (smartparens-mode t)

  (setq-local completion-at-point-functions
              (list (cape-capf-super #'elisp-completion-at-point #'yasnippet-capf)
                    #'cape-dabbrev
                    #'cape-file
                    #'cape-elisp-symbol)))

(add-hook 'emacs-lisp-mode-hook 'icejam-activate-emacs-lisp-mode)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
