;;; web -- summary
;;; Commentary:
;;; Code:

(require 'pkg/lsp "$HOME/.emacs.d/pkg/lsp.el")
(require 'pkg/flycheck "$HOME/.emacs.d/pkg/flycheck.el")

(use-package web-mode
  :requires (lsp-mode flycheck)
  :ensure t)

;; Eex Web mode
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))

;; ERB mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; React Typescript
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

;; Plain React
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-extra-auto-pairs
      '(("eex"  . (("<%" "%>")))
        ("leex"  . (("<%" "%>")))
        ("erb"  . (("<%" "%>")
                   ("beg" "end")))))

(defun activate-web-mode ()
	"Web mode overrides."
	;; Indent web mode scripts by 2
	(setq web-mode-script-padding 2)
	(setq web-mode-code-indent-offset 2)
  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))

  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet capf))

	(when (string-match-p "jsx" (buffer-file-name))
		(lsp))
	(when (string-match-p "tsx" (buffer-file-name))
		(lsp)))

(add-hook 'web-mode-hook 'activate-web-mode)

(provide 'languages/web)
;;; web.el ends here
