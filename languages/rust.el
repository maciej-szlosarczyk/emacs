;;; rust -- summary
;;; Commentary:
;;; Code:

(defun activate-rust-mode ()
  "All things for Rust mode"
  (interactive)
  (set-indent 4)
  (column-enforce-n 99)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet))
  )

(add-hook 'rust-mode-hook 'activate-rust-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)

(provide 'rust)
;;; rust.el ends here
