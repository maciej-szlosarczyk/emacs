;;; languages/elixir -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-flycheck)
(require 'icejam-transient)

(declare-function lsp "lsp-mode" nil)
(declare-function column-enforce-n "column-enforce-mode" (number))

;; Only load the elixir-format from elixir mode.
(use-package elixir-format :defer t
  :ensure (:type git :host github :repo "elixir-editors/emacs-elixir" :files ("elixir-format.el")))

(use-package elixir-ts-mode :ensure t :defer t
  :after (elixir-format lsp-mode lsp-ui))

(transient-define-prefix icejam-elixir-lang-menu ()
  "Elixir Buffer Commands."
  [""
   ["LSP"
    ("m" "iMenu"       lsp-ui-imenu)]
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      elixir-format)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("e" "Show Errors" flymake-show-buffer-diagnostics)]]
  [""
   ("q" "Quit"        keyboard-quit)])

(add-to-list
 'icejam-language-transient-alist '(elixir-ts-mode . icejam-elixir-lang-menu))

(defun icejam-activate-elixir-ts-mode ()
  "All things Elixir."
  (icejam-set-indent 2)
  (column-enforce-n 98)
  (lsp)

  ;; If needed, switch the one below to false to disable documentation pop-ups
  ;; (setq-local lsp-ui-doc-enable t)

  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local lsp-completion-enable-additional-text-edit nil)
  (setq-local completion-at-point-functions
              (list (cape-capf-super #'lsp-completion-at-point
                                     #'yasnippet-capf)
                    #'cape-dabbrev
                    #'cape-file)))

(add-hook 'heex-ts-mode-hook 'icejam-activate-elixir-ts-mode)
(add-hook 'elixir-ts-mode-hook 'icejam-activate-elixir-ts-mode)

(provide 'icejam-lang-elixir)
;;; icejam-lang-elixir.el ends here
