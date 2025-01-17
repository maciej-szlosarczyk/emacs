;;; lean -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function lsp-deferred 'lsp-mode)
(declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)

(use-package lean4-mode
  :ensure (lean4-mode
           :type git
           :host github
           :repo "leanprover/lean4-mode"
           :files ("*.el" "data"))
  :requires (lsp)
  :defer t)

(defun icejam-activate-lean-mode ()
  "All things for Lean mode."
  (interactive)

  ;; Run LSP
  (lsp-deferred)

  ;; Capf override
  (icejam-set-lsp-capfs))

(add-hook 'lean4-mode-hook #'icejam-activate-lean-mode)

(provide 'icejam-lang-lean)
;;; icejam-lang-lean.el ends here
