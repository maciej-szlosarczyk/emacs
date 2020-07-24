;;; elixir -- summary
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :requires (lsp-mode lsp-ui)
  :ensure t
  :config)

(defun activate-elixir-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 98)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (define-key elixir-mode-map (kbd "<f17>") 'elixir-format)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'elixir-mode-hook 'activate-elixir-mode)

(provide 'elixir)
;;; elixir.el ends here
