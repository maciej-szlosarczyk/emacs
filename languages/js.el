;;; Js -- summary
;;; Commentary:

;;; Code:

;;========== Editor config =========================
(defun editor-config-js ()
  "Editor configuration for Javascript."
  (set-indent 2)
  (set-width-80))

;;========== Code completion =======================
(defun completion-config-js ()
  "Code completion and inspection for Javascript."
  (company-mode 1)
  (flycheck-mode 1)
  (flymake-mode)
  (set (make-local-variable 'company-backends)
       '((company-tern company-capf company-dabbrev-code company-yasnippet
                        company-files))))

;;========== Hooks =================================
(add-hook 'js-mode-hook 'editor-config-js)
(add-hook 'js-mode-hook 'completion-config-js)

(provide 'js)
;;; js.el ends here
