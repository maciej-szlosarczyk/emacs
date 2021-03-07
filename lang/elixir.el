;;; languages/elixir -- summary
;;; Commentary:
;;; Code:

(require 'icejam-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require 'icejam-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require 'icejam-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package elixir-mode
  :requires (lsp-mode lsp-ui)
  :straight t)

(defhydra my-elixir/context-hydra (:color teal :hint nil)
  "
^                                   Elixir actions
^^^^^^^^--------------------------------------------------------------------------------------------
Buffer: _r_: Reload _f_: Format _i_: Indent
Other:  _m_: iMenu
^^
"
  ("q" nil "cancel" :color blue)
  ("r" revert-buffer-no-confirm)
  ("i" mark-and-indent-whole-buffer)
  ("f" elixir-format)
  ("m" lsp-ui-imenu))

(defun activate-elixir-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 98)
  (lsp)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (define-key elixir-mode-map (kbd "<f17>") 'elixir-format)

  ;; If needed, switch the one below to false to disable documentation pop-ups
  ;; (setq-local lsp-ui-doc-enable t)

  (define-key elixir-mode-map (kbd "C-c l") 'my-elixir/context-hydra/body)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'elixir-mode-hook 'activate-elixir-mode)

(provide 'icejam-lang-elixir)
;;; elixir.el ends here
