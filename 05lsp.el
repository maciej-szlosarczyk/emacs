;;; 05lsp -- summary
;;; Commentary:
;;; Global Language Server Protocol Config
;;; Code:

(use-package lsp-mode
  :ensure t
  :defer t
  :requires (company)
  :config (setq-default lsp-file-watch-threshold 10000
                        lsp-restart 'interactive
                        lsp-prefer-capf t
                        lsp-server-trace t
                        read-process-output-max (* 1024 1024)
                        lsp-enable-file-watchers nil)
  :hook ((typescript-mode . lsp-deferred)
         (elixir-mode . lsp)
         (js2-mode . lsp-deferred)))

(use-package lsp-ui
  :ensure t
  :requires (lsp-mode)
  :defer t)

(setq lsp-ui-doc-enable t
      lsp-ui-header t
      lsp-ui-doc-include-signature t
      lsp-log-io nil)

(provide '05lsp)
;;; 05lsp.el ends here
