;;; Languages -- summary
;;; Commentary:

;;; Code:
;;;; Major languages ;;;;
;;; Intial imports
(require 'company)

;; Imports
(load "~/.emacs.d/languages/ruby.el")
(load "~/.emacs.d/languages/python.el")
(load "~/.emacs.d/languages/elisp.el")
(load "~/.emacs.d/languages/elixir.el")
(load "~/.emacs.d/languages/rust.el")
(load "~/.emacs.d/languages/web.el")
(load "~/.emacs.d/languages/js.el")

;;; SQL
(defun sql-mode-hook ()
  "Editor setup for SQL."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'haskell-mode-hook 'haskell-mode-config)
  (remove-hook 'java-mode-hook 'java-mode-config)

  (set-indent 4))

(add-hook 'sql-mode-hook 'flycheck-mode)
(add-hook 'sql-mode-hook 'set-width-120)

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

;;; Java
(defun java-mode-config ()
  "Setup editor for java."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'haskell-mode-hook 'haskell-mode-config)
  (remove-hook 'rust-mode-hook 'rust-mode-config)

  (set-indent 2))

(add-hook 'rust-mode-hook 'java-mode-config)
(add-hook 'java-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'set-width-120)
;;;; Other things ;;;;;
;;; Javascript
(setq js-indent-level 2)

;; Markdown mode
(defun markdown-mode-config ()
  "Setup markdown mode."
  (set-indent 2))

(add-hook 'markdown-mode-hook 'markdown-mode-config)
(add-hook 'markdown-mode-hook 'set-width-80)

;; Shell things
(defun shell-mode-config ()
  "Setup shell mode."
  )

(setq ansi-color-for-comint-mode t) ;; Properly display colors in shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;; languages.el ends here
