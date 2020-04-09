(use-package elm-mode
  :ensure t
  :defer t)

(defun activate-elm-mode ()
  "All things Elixir."
  (set-indent 2)
  (column-enforce-n 80)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(elm-company company-yasnippet))
  (define-key elm-mode-map (kbd "TAB") 'elm-indent-cycle))

(add-hook 'elm-mode-hook 'activate-elm-mode)
