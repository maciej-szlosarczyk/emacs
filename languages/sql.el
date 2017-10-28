;;; SQL -- summary
;;; Commentary:

;;; Code:

;;========== Editor config =========================
(defun editor-config-sql ()
  "Setup editor for SQL."
  (set-indent 4)
  (set-width-120))

;;========== Company config =========================
(defun completion-config-sql ()
  (company-mode 1)
  (flycheck-mode 1)

  (set (make-local-variable 'company-backends)
       '(company-yasnippet company-etags company-dabbrev-code company-capf
                           company-files)))

;;========== Hooks =========================
(add-hook 'sql-mode-hook 'editor-config-sql)
(add-hook 'sql-mode-hook 'completion-config-sql)



;;; sql.el ends here.
