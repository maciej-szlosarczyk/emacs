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
  (remove-hook 'html-mode-hook 'web-mode-config)

  (set-indent 2))

;; Do not align 'begin' and 'while' ;;
(setq ruby-align-to-stmt-keywords '(if begin case elseif rescue))

;; Do not indent inside the parenthasis
(setq ruby-deep-indent-paren nil)

;; Do not insert encoding comments ;;
(setq ruby-insert-encoding-magic-comment nil)

;; Use web-mode for erb
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(add-hook 'ruby-mode-hook 'ruby-mode-config)
(add-hook 'ruby-mode-hook 'set-width-80)

;; Use longer lines for HAML
(add-hook 'haml-mode-hook 'set-width-120)

;;; Rust
(defun rust-mode-config ()
  "Setup editor for rust."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'haskell-mode-hook 'haskell-mode-config)

  (set-indent 4))

(add-hook 'rust-mode-hook 'rust-mode-config)
(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'rust-mode-hook 'set-width-99)

;;; Elixir
;; Note: there is no flycheck support for Elixir yet
(require 'alchemist)
(defun elixir-mode-config ()
  "Call elixir mode config."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'haskell-mode-hook 'haskell-mode-config)

  (set-indent 2))

(add-hook 'elixir-mode-hook 'elixir-mode-config)
(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'elixir-mode-hook 'ruby-end-mode)
(add-hook 'elixir-mode-hook 'set-width-80)

;;; Haskell
(defun haskell-mode-config ()
  "Call haskell mode config."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)

  (set-indent 4))

(add-hook 'haskell-mode-hook 'haskell-mode-config)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'set-width-80)

;;; Elisp
(defun elisp-mode-config ()
  "Setup editor for Lisp."
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'haskell-mode-hook 'haskell-mode-config)

  (set-indent 2)

  (flycheck-mode 1))

(add-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'set-width-80)

;;;; Other things ;;;;;
;;; Javascript
(setq js-indent-level 2)

;;; Web-mode
(defun web-mode-config ()
  "Setup web mode."
  (remove-hook 'rust-mode-hook 'rust-mode-config)
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)

  (flycheck-mode 1)
  (set-indent 2))

(add-hook 'html-mode-hook 'web-mode)
(add-hook 'html-mode-hook 'web-mode-config)
(add-hook 'html-mode-hook 'set-width-120)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; CSS-mode
(setq css-indent-offset 2)

;; Markdown mode
(defun markdown-mode-config ()
  "Setup markdown mode."
  (set-indent 2))
(add-hook 'markdown-mode-hook 'markdown-mode-config)
(add-hook 'markdown-mode-hook 'set-width-80)

;;; languages.el ends here
