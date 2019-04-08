(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'elixir-mode-hook 'ruby-end-mode)

(defun activate-elixir-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 80)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(alchemist-company company-yasnippet)))

(add-hook 'alchemist-mode-hook 'activate-elixir-mode)
