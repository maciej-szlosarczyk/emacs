;;; languages/erlang -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function lsp 'lsp-mode)
(declare-function column-enforce-n 'column-enforce-mode)
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)

(use-package erlang
  :defer t
  :ensure (:depth 1)
  :after (lsp lsp-ui))

(defun icejam-activate-erlang-mode ()
  "Start Erlang related editing process."
  (icejam-set-indent 4)
  (column-enforce-n 80)

  ;; Start LSP
  (lsp)

  ;; Capf override
  (icejam-set-lsp-capfs))

(add-hook 'erlang-mode-hook 'icejam-activate-erlang-mode)

(provide 'icejam-lang-erlang)
;;; icejam-lang-erlang.el ends here
