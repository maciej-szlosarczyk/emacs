;;; rust -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function lsp-deferred 'lsp-mode)

(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)

(use-package rust-mode
  :ensure t
  :defer t
  :config
  (setq rust-mode-treesitter-derive t))

(use-package flycheck-rust
  :ensure t
  :defer t
  :requires (rust-mode lsp))

(defun icejam-activate-rust-mode ()
  "All things for Rust mode."
  (interactive)
  (icejam-set-indent 4)
  (column-enforce-n 99)

  ;; Run LSP
  (lsp-deferred)
  (icejam-set-lsp-capfs))

(add-hook 'rust-mode-hook 'icejam-activate-rust-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)

(provide 'icejam-lang-rust)
;;; icejam-lang-rust.el ends here
