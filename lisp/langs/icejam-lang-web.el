;;; web -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-lsp)
(require 'icejam-flycheck)

(use-package web-mode
  :requires (lsp-mode flycheck)
  :ensure t)

;; Eex Web mode
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))

;; ERB mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; Vue JS
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-extra-auto-pairs
      '(("eex"  . (("<%" "%>")))
        ("leex"  . (("<%" "%>")))
        ("erb"  . (("<%" "%>")
                   ("beg" "end")))))

(defun icejam-activate-web-mode ()
	"Web mode overrides."
	;; Indent web mode scripts by 2
	(setq-local web-mode-script-padding 2)
	(setq-local web-mode-code-indent-offset 2)
	(setq-local web-mode-markup-indent-offset 2)
  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))

  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet))

	(when (string-match-p ".jsx" (buffer-file-name))
		(lsp))
	(when (string-match-p ".tsx" (buffer-file-name))
		(lsp))
	(when (string-match-p ".vue" (buffer-file-name))
		(lsp)))

(add-hook 'web-mode-hook 'icejam-activate-web-mode)

(provide 'icejam-lang-web)
;;; icejam-lang-web.el ends here
