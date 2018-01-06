;;; Go -- summary
;;; Commentary:

;; Code:

;;========== Editor config =========================
(defun editor-config-go ()
  "Editor configuration for Go."
  (set-indent 4)
  (set-width-99))

;;========== Code completion =======================
(defun completion-config-go ()
  "Code completion and inspection for Go."
  (company-mode 1)
  (flycheck-mode 1)
  (flymake-mode 1)
  (set (make-local-variable 'company-backends)
       '((company-go company-capf company-dabbrev-code company-yasnippet
                        company-files))))

;;========== Hooks =================================
(add-hook 'go-mode-hook 'editor-config-go)
(add-hook 'go-mode-hook 'completion-config-go)

(provide 'go)
;;; go.el ends here
