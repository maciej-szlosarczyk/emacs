;;; Web -- summary
;;; Commentary:

;;; Code:
(require 'web-mode)
;;========== Editor config =========================
(defun editor-config-web ()
  "Editor configuration for Web."
  (set-indent 2)
  (set-width-120)

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq css-indent-offset 2))

;;========== Code completion =======================
(defun completion-config-web ()
  "Code completion and inspection for Web."
  (company-mode 1)
  (flycheck-mode 1)
  (flymake-mode)
  (set (make-local-variable 'company-backends)
       '((company-capf company-dabbrev-code company-yasnippet
                        company-files))))

;;========== Hooks =================================
(add-hook 'html-mode-hook 'editor-config-web)
(add-hook 'html-mode-hook 'completion-config-web)

(provide 'web)
;;; web.el ends here
