;;; languages/elisp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(transient-define-prefix icejam/elisp-lang-menu ()
  "Elisp Buffer Commands."
  [""
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(defun icejam/activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."
  (icejam/set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (setq-default indent-tabs-mode nil)

  (define-key emacs-lisp-mode-map (kbd "C-c l") 'icejam/elisp-lang-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-elisp)))

(add-hook 'emacs-lisp-mode-hook 'icejam/activate-emacs-lisp-mode)

(provide 'icejam-lang-elisp)
;;; icejam-lang-elisp.el ends here
