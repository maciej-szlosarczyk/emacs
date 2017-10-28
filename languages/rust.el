;;; Rust -- summary
;;; Commentary:

;;; Code:

;;========== Editor config =========================
(defun editor-config-rust ()
  "Editor configuration for Rust."
  (set-indent 4)
  (set-width-99))

;;========== Code completion =======================
(defun completion-config-rust ()
  "Code completion and inspection for Rust."
  (racer-mode 1)
  (company-mode 1)
  (flycheck-mode 1)
  (flymake-mode 1)
  (set (make-local-variable 'company-backends)
       '((company-racer company-capf company-dabbrev-code company-yasnippet
                        company-files))))

;;========== Hooks =================================
(add-hook 'rust-mode-hook 'editor-config-rust)
(add-hook 'rust-mode-hook 'completion-config-rust)

(provide 'rust)
;;; rust.el ends here
