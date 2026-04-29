;;; icejam-eglot -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Language Server Protocol Config
;;; Code:

(eval-when-compile
  (declare-function eglot-completion-at-point 'eglot)
  (declare-function eglot-managed-p 'eglot))

(use-package eglot :ensure nil
  :config
  ;; Use Ruby-Lsp instead of Solargraph
  (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) "ruby-lsp"))

  (setopt eglot-advertise-cancellation t)

  ;; Automatically kill eglot when last buffer associated with a project is
  ;; closed.
  (setopt eglot-autoshutdown t)

  ;; Set up server specific switches globally
  (setq-default eglot-workspace-configuration
                ;; Elixir configuration
                '(:elixirLS (
                             :autoBuild t
                             :dialyzerEnabled t
                             :incrementalDialyzer :json-false
                             :autoInsertRequiredAlias :json-false
                             :suggestSpecs t
                             )))

  ;; Eglot insists on adding itself to the completion-at-point-functions but
  ;; that means that it overrides our combined value of (eglot + yasnippet)
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (when eglot--managed-mode
                (remove-hook 'completion-at-point-functions
                             #'eglot-completion-at-point t)))))

(defun icejam-start-eglot ()
  "Start eglot unless already started."
  (unless (eglot-managed-p)
    (eglot-ensure)))

(use-package eldoc-box
  :ensure (:host github :repo "casouri/eldoc-box")
  :hook ((emacs-lisp-mode . eldoc-box-hover-at-point-mode)
         (eglot--managed-mode . eldoc-box-hover-at-point-mode))
  :custom-face
  (eldoc-box-markdown-separator ((t (:inherit (fringe))))))

;; Add debugger support to emacs.
(use-package dape :ensure t)

(provide 'icejam-eglot)
;;; icejam-eglot.el ends here
