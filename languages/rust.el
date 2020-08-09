;;; rust -- summary
;;; Commentary:
;;; Code:

(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")
(require '05flycheck "$HOME/.emacs.d/05flycheck.el")

(use-package rust-mode
  :ensure t
  :defer t)

(use-package flycheck-rust
  :ensure t
  :defer t
  :requires (rust-mode))

(use-package racer
  :ensure t
  :defer t
  :requires (rust-mode))

(defun activate-rust-mode ()
  "All things for Rust mode."
  (interactive)
  (set-indent 4)
  (column-enforce-n 99)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'rust-mode-hook 'activate-rust-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)
(add-hook 'rust-mode-hook 'racer-mode)

(provide 'languages/rust)
;;; rust.el ends here
