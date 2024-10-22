;;; rust -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)

(use-package rust-mode
  :straight t
  :defer t
  :config
  (setq rust-mode-treesitter-derive t))

(use-package flycheck-rust
  :straight t
  :defer t
  :requires (rust-mode lsp))

(defun icejam-activate-rust-mode ()
  "All things for Rust mode."
  (interactive)
  (icejam-set-indent 4)
  (column-enforce-n 99)

  ;; Run LSP
  (lsp-deferred)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'rust-mode-hook 'icejam-activate-rust-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)

(provide 'icejam-lang-rust)
;;; icejam-lang-rust.el ends here
