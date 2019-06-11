;; Use js2-mode for javascript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;; Language Server Protocol is used for completion
(add-hook 'js2-mode-hook 'lsp)

(defun activate-js2-mode ()
  "Company list override."
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-lsp)))

(add-hook 'js2-mode-hook 'activate-js2-mode)

(defun activate-web-mode ()
  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-web-html company-yasnippet)))

(add-hook 'web-mode-hook 'activate-web-mode)
