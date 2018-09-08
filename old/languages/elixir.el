;;; Elixir -- summary
;;; Commentary:

;;; Code:
;;========== Editor config =========================
(defun editor-config-elixir ()
  "Editor configuration for Elixir."
  (set-indent 2)
  (set-width-80)
  (ruby-end-mode 1))

;;========== Code completion =======================
(defun completion-config-elixir ()
  "Code completion and inspection for Elixir."
  (alchemist-mode 1)
  (company-mode 1)
  (set (make-local-variable 'company-backends)
       '((alchemist-company company-yasnippet company-files))))

;;========== Hooks =================================
(add-hook 'elixir-mode-hook 'editor-config-elixir)
(add-hook 'elixir-mode-hook 'completion-config-elixir)

(provide 'elixir)
;;; elixir.el ends here
