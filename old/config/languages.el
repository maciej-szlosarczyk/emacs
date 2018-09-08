;;; Languages -- summary
;;; Commentary:

;;; Code:
;;;; Major languages ;;;;
;;; Intial imports
(require 'company)

;; Imports
(load "~/.emacs.d/languages/ruby.elc")
(load "~/.emacs.d/languages/python.elc")
(load "~/.emacs.d/languages/elisp.elc")
(load "~/.emacs.d/languages/elixir.elc")
(load "~/.emacs.d/languages/rust.elc")
(load "~/.emacs.d/languages/web.elc")
(load "~/.emacs.d/languages/js.elc")
(load "~/.emacs.d/languages/sql.elc")
(load "~/.emacs.d/languages/haskell.elc")
(load "~/.emacs.d/languages/go.elc")

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
;;; languages.el ends here.
