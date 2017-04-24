;;; Languages -- summary
;;; Commentary:

;;; Code:
;;;; Major languages ;;;;
;;; Ruby
(defun ruby-mode-config ()
  "Setup editor for Ruby."
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)

  (set-line-80)
  (set-tab-2)

  (aggressive-mode-indent)
  (defun align-to-colon (begin end)
    "Align region to colon signs"
    (align-regexp begin end
                  (rx ":" (group (zero-or-mode (syntax-white))))))
  ;; Do not align 'begin' and 'while' ;;
  (setq ruby-align-to-stmt-keywords '(if begin case elseif rescue))

  ;; Do not indent inside the parenthasis
  (setq ruby-deep-indent-paren nil)

  ;; Do not insert encoding comments ;;
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Use web-mode for erb
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

(add-hook 'ruby-mode-hook 'ruby-mode-config)

;;; Rust
(defun rust-mode-config ()
  "Setup editor for rust."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)

  (whitespace-mode -1)
  (set-line-99)
  (set-tab-4)
  (whitespace-mode 1)

  (flycheck-mode 1))

(add-hook 'rust-mode-hook 'rust-mode-config)

;;; Elixir
;; Note: there is no flycheck support for Elixir yet
(require 'alchemist)
(defun elixir-mode-config ()
  "Call elixir mode config."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (alchemist-mode 1)

  (set-line-80)
  (set-tab-2)

  (ruby-end-mode))

(add-hook 'elixir-mode-hook 'elixir-mode-config)

;;; Elisp
(defun elisp-mode-config ()
  "Setup editor for Lisp."
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)

  (set-line-80)
  (set-tab-2)

  (flycheck-mode 1))

(add-hook 'emacs-lisp-mode-hook 'elisp-mode-config)

;;;; Other things ;;;;;
;;; Javascript
(setq js-indent-level 2)

;;; Web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;;; languages.el ends here
