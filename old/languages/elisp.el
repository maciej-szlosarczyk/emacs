;;; Elisp -- summary
;;; Commentary:

;;; Code:

;;========== Editor config =========================
(defun editor-config-elisp ()
  "Editor configuration for Elisp."
  (set-indent 2)
  (set-width-80))

;;========== Code completion =======================
(defun completion-config-elisp ()
  "Code completion and inspection for Elisp."
  (company-mode 1)
  (flycheck-mode 1)
  (set (make-local-variable 'company-backends)
       '((company-yasnippet company-capf company-dabbrev-code company-files))))

;;========== Hooks =================================
(add-hook 'emacs-lisp-mode-hook 'editor-config-elisp)
(add-hook 'emacs-lisp-mode-hook 'completion-config-elisp)
;;; elisp.el ends here.
