;;; pkg/lsp -- summary
;;; Commentary:
;;; Global Language Server Protocol Config
;;; Code:

(use-package lsp-mode
  :ensure t
  :defer t
  :requires (company)
  :config (setq-default lsp-file-watch-threshold 10000
                        lsp-restart 'auto-restart
                        lsp-prefer-capf t
                        lsp-completion-provider :capf
                        lsp-server-trace nil
                        read-process-output-max (* 1024 1024 2)
                        lsp-enable-file-watchers nil)
  :hook ((typescript-mode . lsp-deferred)
         (elixir-mode . lsp)
         (purescript-mode . lsp-deferred)
         (js2-mode . lsp-deferred)))

(use-package lsp-ui
  :ensure t
  :requires (lsp-mode)
  :defer t)

(setq lsp-ui-doc-enable t
      lsp-ui-header t
      lsp-ui-delay 0.5 ;; Wait half a second to display documentation
      lsp-ui-doc-position 'at-point
      lsp-ui-doc-include-signature t
      lsp-log-io nil)

;; Lsp debugger mode
(use-package dap-mode
  :ensure t
  :defer t
  :requires (lsp-mode lsp-ui))

(provide 'pkg/lsp)
;;; lsp.el ends here
