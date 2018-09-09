(defun activate-rust-mode ()
  "All things for Rust mode"
  (interactive)
  (set-indent 4)
  (column-enforce-n 99))

  ;; (flymake-rust-setup))

(add-hook 'rust-mode-hook 'activate-rust-mode)
(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)
