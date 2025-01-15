;;; languages/erlang -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-lsp)

(declare-function lsp "lsp-mode" nil)
(declare-function column-enforce-n "column-enforce-mode" (number))

(use-package erlang
  :defer t
  :ensure (:depth 1)
  :after (lsp lsp-ui))

(defun icejam-activate-erlang-mode ()
  (icejam-set-indent 4)
  (column-enforce-n 80)

  ;; Start LSP
  (lsp)

  ;; Capf override
  (icejam-set-lsp-capfs))

(add-hook 'erlang-mode-hook 'icejam-activate-erlang-mode)

(provide 'icejam-lang-erlang)
;;; icejam-lang-erlang.el ends here
