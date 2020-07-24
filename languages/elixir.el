;;; languages/elixir -- summary
;;; Commentary:
;;; Code:

(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")
(require '05flycheck "$HOME/.emacs.d/05flycheck.el")
(require '05hydra "$HOME/.emacs.d/05hydra.el")

(use-package elixir-mode
  :requires (lsp-mode lsp-ui)
  :ensure t)

(defhydra my-elixir/context-hydra (:color teal :hint nil)
  "
  Elixir actions

   ^Elixir^                          ^Actions^
^^^^^^^^-----------------------------------------------------------------------
_f_: Format buffer
"
  ("q" nil "cancel" :color blue)

  ("f" elixir-format))

(defun activate-elixir-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 98)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (define-key elixir-mode-map (kbd "<f17>") 'elixir-format)
  (define-key elixir-mode-map (kbd "C-c l") 'my-elixir/context-hydra/body)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'elixir-mode-hook 'activate-elixir-mode)

(provide 'languages/elixir)
;;; elixir.el ends here
