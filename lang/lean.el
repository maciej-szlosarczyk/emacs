;;; lean -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-lsp)

(use-package lean4-mode
  :straight (lean4-mode
	           :type git
	           :host github
	           :repo "leanprover/lean4-mode"
	           :files ("*.el" "data"))
  :requires (lsp)
  :defer t)

(defun activate-lean-mode ()
  "All things for Lean mode."
  (interactive)

  ;; Run LSP
  (lsp-deferred)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'lean4-mode-hook 'activate-lean-mode)

(provide '+custom-lang-lean)
;;; lean.el ends here
