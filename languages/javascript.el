(use-package js2-mode
  :requires (web-mode company-web lsp)
  :ensure t)

;; Use js2-mode for javascript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;; Use js2-mode for typescript editing
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js2-mode))

;; Language Server Protocol is used for completion
(add-hook 'js2-mode-hook 'lsp)

(defun activate-js2-mode ()
	"JS2 mode overrides."
	(set-indent 2)
	(column-enforce-n 80)
	(setq-local js2-basic-offset 2)

  ;; "Company list override."
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-lsp)))

(add-hook 'js2-mode-hook 'activate-js2-mode)
