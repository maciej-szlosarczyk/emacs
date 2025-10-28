;;; rust -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(use-package rust-mode
  :ensure t
  :defer t
  :config (setopt rust-mode-treesitter-derive t))

(use-package rustic
  :ensure t
  :defer t
  :after (rust-mode)
  :config (setopt rustic-format-on-save nil)
  (setopt rustic-lsp-client 'eglot))

(use-package flycheck-rust
  :ensure t
  :defer t
  :after (rust-mode lsp))

(defun icejam-activate-rust-mode ()
  "All things for Rust mode."
  (interactive)
  (icejam-set-indent 4)
  (column-enforce-n 99)

  ;; Run LSP
  (eglot-ensure)
  (icejam-set-eglot-capfs))

(add-hook 'rust-mode-hook 'icejam-activate-rust-mode)
(add-hook 'rust-mode-hook 'flycheck-rust-setup)

(provide 'icejam-lang-rust)
;;; icejam-lang-rust.el ends here
