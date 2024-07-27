;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(transient-define-prefix +custom-lang-elisp/transient-context-menu ()
  "Elisp Buffer Commands."
  [""
   ["Buffer"
    ("r" "Reload"      revert-buffer-no-confirm)
    ("i" "Indent"      mark-and-indent-whole-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(defun activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (setq-default indent-tabs-mode nil)

  (define-key emacs-lisp-mode-map
              (kbd "C-c l") '+custom-lang-elisp/transient-context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-elisp)))

(add-hook 'emacs-lisp-mode-hook 'activate-emacs-lisp-mode)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
