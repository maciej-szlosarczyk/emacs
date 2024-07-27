;;; rust -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(use-package rust-mode
  :straight t
  :defer t)

(use-package flycheck-rust
  :straight t
  :defer t
  :requires (rust-mode lsp))

(defun activate-rust-mode ()
  "All things for Rust mode."
  (interactive)
  (set-indent 4)
  (column-enforce-n 99)

  ;; Run LSP
  (lsp-deferred)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'rust-mode-hook 'activate-rust-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)

(provide '+custom-lang-rust)
;;; rust.el ends here
