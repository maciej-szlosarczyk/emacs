(add-hook 'emacs-lisp-mode-hook 'flymake-mode)

(defun activate-emacs-lisp-mode ()
  "Goodies for editing emacs files."
  (set-indent 2) ;; Default indentation of 2 characters
  )

(add-hook 'emacs-lisp-mode-hook 'activate-emacs-lisp-mode)
