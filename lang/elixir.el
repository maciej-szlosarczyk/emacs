;;; languages/elixir -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require '+custom-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package elixir-mode :requires (lsp-mode lsp-ui) :straight t)

(add-to-list 'auto-mode-alist '("\\.heex\\'" . elixir-mode))

(transient-define-prefix +my-transient-elixir-context-menu ()
  "Elixir Buffer Commands"
  [""
   ["LSP"
    ("m" "iMenu"       lsp-ui-imenu)]
   ["Buffer"
    ("r" "Reload"      revert-buffer-no-confirm)
    ("f" "Format"      elixir-format)
    ("i" "Indent"      mark-and-indent-whole-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(defun activate-elixir-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 98)
  (lsp)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local company-minimum-prefix-length 3)
  (define-key elixir-mode-map (kbd "<f17>") 'elixir-format)

  ;; If needed, switch the one below to false to disable documentation pop-ups
  ;; (setq-local lsp-ui-doc-enable t)

  (define-key elixir-mode-map (kbd "C-c l") '+my-transient-elixir-context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'elixir-mode-hook 'activate-elixir-mode)

(provide '+custom-lang-elixir)
;;; elixir.el ends here
