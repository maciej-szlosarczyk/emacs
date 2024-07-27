;;; languages/elixir -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-flycheck)
(require 'icejam-transient)

(use-package elixir-mode :defer t :straight t)
(use-package elixir-ts-mode :requires (elixir-mode lsp-mode lsp-ui) :straight t)

(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-ts-mode))
(add-to-list 'auto-mode-alist '("\\.heex\\'" . elixir-ts-mode))

(transient-define-prefix +custom-lang-elixir/transient-context-menu ()
  "Elixir Buffer Commands."
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

(defun +custom-lang-elixir/activate-elixir-ts-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 98)
  (lsp)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local company-minimum-prefix-length 3)

  ;; If needed, switch the one below to false to disable documentation pop-ups
  ;; (setq-local lsp-ui-doc-enable t)

  (define-key elixir-ts-mode-map (kbd "C-c l") '+custom-lang-elixir/transient-context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'elixir-ts-mode-hook '+custom-lang-elixir/activate-elixir-ts-mode)

(provide 'icejam-lang-elixir)
;;; icejam-lang-elixir.el ends here
