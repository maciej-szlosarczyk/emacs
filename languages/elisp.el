(defun activate-emacs-lisp-mode ()
  "Goodies for editing emacs files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (setq-default indent-tabs-mode nil)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-elisp))

  (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook 'activate-emacs-lisp-mode)
