;;; icejam-lsp -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Language Server Protocol Config
;;; Code:

;; https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
;; This supposedly makes it faster.
(setenv "LSP_USE_PLISTS" "true")
(use-package lsp-mode :ensure t :defer t
  :config
  (add-to-list 'lsp-disabled-clients '(typescript-ts-mode . vue-semantic-server))
  (add-to-list 'lsp-disabled-clients '(js-mode . vue-semantic-server))
  (add-to-list 'lsp-disabled-clients '(css-mode . vue-semantic-server))

  (setq-default lsp-file-watch-threshold 10000
                lsp-restart 'auto-restart
                lsp-prefer-capf t
                lsp-completion-provider :capf
                lsp-server-trace nil
                lsp-lens-enable nil
                lsp-diagnostics-provider :flymake
                lsp-lens-mode nil
                read-process-output-max (* 1024 1024 4)
                lsp-log-io nil
                ;; Do not use Vue language server for everything .JS/TS/TSX
                lsp-volar-take-over-mode nil
                lsp-enable-file-watchers nil)
  (unbind-key "s-l =" lsp-mode-map)
  (unbind-key "s-l G" lsp-mode-map)
  (unbind-key "s-l T" lsp-mode-map)
  (unbind-key "s-l a" lsp-mode-map)
  (unbind-key "s-l g" lsp-mode-map)
  (unbind-key "s-l r" lsp-mode-map)
  (unbind-key "C-S-SPC" lsp-mode-map)
  (unbind-key "s-l G g" lsp-mode-map)
  (unbind-key "s-l G r" lsp-mode-map)
  (unbind-key "s-l G s" lsp-mode-map)
  (unbind-key "s-l h g" lsp-mode-map)
  (unbind-key "s-l h h" lsp-mode-map)
  (unbind-key "s-l h s" lsp-mode-map)
  (unbind-key "s-l g a" lsp-mode-map)
  (unbind-key "s-l g e" lsp-mode-map)
  (unbind-key "s-l g g" lsp-mode-map)
  (unbind-key "s-l g h" lsp-mode-map)
  (unbind-key "s-l g r" lsp-mode-map)
  (unbind-key "s-l T D" lsp-mode-map)
  (unbind-key "s-l T L" lsp-mode-map)
  (unbind-key "s-l T S" lsp-mode-map)
  (unbind-key "s-l T T" lsp-mode-map)
  (unbind-key "s-l T b" lsp-mode-map)
  (unbind-key "s-l T d" lsp-mode-map)
  (unbind-key "s-l T f" lsp-mode-map)
  (unbind-key "s-l T l" lsp-mode-map)
  (unbind-key "s-l T s" lsp-mode-map)
  (unbind-key "s-l F a" lsp-mode-map)
  (unbind-key "s-l F b" lsp-mode-map)
  (unbind-key "s-l F r" lsp-mode-map)
  (unbind-key "s-l = =" lsp-mode-map)
  (unbind-key "s-l s D" lsp-mode-map)
  (unbind-key "s-l s d" lsp-mode-map)
  (unbind-key "s-l s q" lsp-mode-map)
  (unbind-key "s-l s r" lsp-mode-map)
  (unbind-key "s-l s s" lsp-mode-map))

(use-package lsp-ui :ensure t :after (lsp-mode) :defer t
  :config
  (setopt lsp-ui-doc-enable t
          lsp-ui-header t
          lsp-ui-delay 0.5 ;; Wait half a second to display documentation
          lsp-ui-doc-position 'at-point
          lsp-ui-doc-include-signature t))

;; Lsp debugger mode
(use-package dap-mode :ensure t :after (lsp-mode lsp-ui) :defer t)

(provide 'icejam-lsp)
;;; icejam-lsp.el ends here
