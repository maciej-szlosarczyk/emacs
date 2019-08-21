(use-package web-mode
  :ensure t)

;; Eex Web mode
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

;; ERB mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; Vue
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; React Typescript
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(setq web-mode-extra-auto-pairs
      '(("eex"  . (("<%" "%>")))
        ("erb"  . (("<%" "%>")
                   ("beg" "end")))))

(defun activate-web-mode ()
	"Web mode overrides."
	;; Indent web mode scripts by 2
	(setq web-mode-script-padding 2)
	(setq web-mode-code-indent-offset 2)

  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-lsp))

	(when (string-match-p "vue" (buffer-file-name))
		(lsp)))

(add-hook 'web-mode-hook 'activate-web-mode)
