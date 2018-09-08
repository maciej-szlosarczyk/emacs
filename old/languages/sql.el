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

(require 'sql-indent)

;;========== Functions =====================
(defun sql-indent-string ()
  "Indents the string under the cursor as SQL."
  (interactive)
  (save-excursion
    (er/mark-inside-quotes)
    (let* ((text (buffer-substring-no-properties (region-beginning) (region-end)))
           (pos (region-beginning))
           (column (progn (goto-char pos) (current-column)))
           (formatted-text (with-temp-buffer
                             (insert text)
                             (delete-trailing-whitespace)
                             (sql-indent-buffer)
                             (replace-string "\n" (concat "\n" (make-string column (string-to-char " "))) nil (point-min) (point-max))
                             (buffer-string))))
      (delete-region (region-beginning) (region-end))
      (goto-char pos)
      (insert formatted-text))))


;;; sql.el ends here.
