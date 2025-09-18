;;; lean -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)

(use-package lean4-mode
  :ensure (lean4-mode
           :type git
           :host github
           :repo "leanprover/lean4-mode"
           :files ("*.el" "data"))
  :defer t)

(defun icejam-activate-lean-mode ()
  "All things for Lean mode."
  (interactive)

  ;; Run LSP
  (eglot-ensure)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'lean4-mode-hook #'icejam-activate-lean-mode)

(provide 'icejam-lang-lean)
;;; icejam-lang-lean.el ends here
