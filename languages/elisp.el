;;; languages/elisp -- summary
;;; Commentary:
;;; Code:

(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")

(defun activate-emacs-lisp-mode ()
  "Goodies for editing Emacs files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (setq-default indent-tabs-mode nil)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-elisp)))

(add-hook 'emacs-lisp-mode-hook 'activate-emacs-lisp-mode)

(provide 'languages/elisp)
;;; elisp.el ends here
