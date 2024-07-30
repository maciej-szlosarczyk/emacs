;;; languages/elixir -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-flycheck)
(require 'icejam-transient)

(declare-function lsp "lsp-mode" nil)
(declare-function column-enforce-n "column-enforce-mode" (number))

(use-package elixir-mode :defer t :straight t)
(use-package elixir-ts-mode :straight t
  :requires (elixir-mode lsp-mode lsp-ui)
  :defines (elixir-ts-mode-map))

(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-ts-mode))
(add-to-list 'auto-mode-alist '("\\.heex\\'" . elixir-ts-mode))

(transient-define-prefix icejam/elixir-lang-menu ()
  "Elixir Buffer Commands."
  [""
   ["LSP"
    ("m" "iMenu"       lsp-ui-imenu)]
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      elixir-format)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(defun icejam/activate-elixir-ts-mode ()
  "All things Elixir."
  (icejam/set-indent 2)
  (column-enforce-n 98)
  (lsp)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local company-minimum-prefix-length 3)

  ;; If needed, switch the one below to false to disable documentation pop-ups
  ;; (setq-local lsp-ui-doc-enable t)

  ;; Enable mode map
  (define-key elixir-ts-mode-map (kbd "C-c l") 'icejam/elixir-lang-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'elixir-ts-mode-hook 'icejam/activate-elixir-ts-mode)

(provide 'icejam-lang-elixir)
;;; icejam-lang-elixir.el ends here
