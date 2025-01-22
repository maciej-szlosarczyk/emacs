;;; languages/elixir -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function -> 'dash)
  (declare-function lsp 'lsp-mode)
  (declare-function yas--table-get-create 'yasnippet)
  (declare-function yas--remove-template-by-uuid 'yasnippet)
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)
  (defvar icejam-language-transient-alist))

;; Only load the elixir-format from elixir mode.
(use-package elixir-format :defer t
  :ensure (:type git
                 :host github
                 :repo "elixir-editors/emacs-elixir"
                 :files ("elixir-format.el")))

(use-package elixir-ts-mode :ensure t :defer t
  :after (elixir-format lsp-mode lsp-ui))

(transient-define-prefix icejam-elixir-lang-menu ()
  [[:description
    (lambda ()
      (concat (propertize "Code actions for " 'face 'transient-heading)
              (propertize (format "%s" major-mode) 'face 'transient-key)
              (propertize ":\n" 'face 'transient-heading)))
    ("m" "LSP iMenu" lsp-ui-imenu)
    ("r" "Reload buffer" icejam-revert-buffer-no-confirm)
    ("e" "Show errors" flymake-show-buffer-diagnostics)
    ("f" "Format buffer with Elixir formatter" elixir-format)

    ("q" "Quit" keyboard-quit)]])

(defun icejam-delete-elixir-snippets ()
  "This function deletes Elixir snippets I don't use."
  (-> 'elixir-mode
      (yas--table-get-create)
      (yas--remove-template-by-uuid "defmodule XXX end")))

(add-to-list
 'icejam-language-transient-alist '(elixir-ts-mode . icejam-elixir-lang-menu))

(defun icejam-activate-elixir-ts-mode ()
  "All things Elixir."
  (icejam-set-indent 2)
  (column-enforce-n 98)
  (lsp)

  ;; If needed, switch the one below to false to disable documentation pop-ups
  ;; (setq-local lsp-ui-doc-enable t)

  (setq-local lsp-eldoc-enable-hover nil
              lsp-completion-enable-additional-text-edit nil)
  (icejam-set-lsp-capfs)
  (icejam-delete-elixir-snippets))

(add-hook 'heex-ts-mode-hook 'icejam-activate-elixir-ts-mode)
(add-hook 'elixir-ts-mode-hook 'icejam-activate-elixir-ts-mode)

(provide 'icejam-lang-elixir)
;;; icejam-lang-elixir.el ends here
