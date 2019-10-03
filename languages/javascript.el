(use-package js2-mode
  :requires (web-mode company-web lsp)
  :ensure t)

(use-package tide
  :ensure t
  :after (company flycheck)
  :hook ((before-save . tide-format-before-save)))

;; Use js2-mode for javascript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;; Use js2-mode for typescript editing
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js2-mode))

(defun activate-js2-mode ()
	"JS2 mode overrides."
  (tide-setup)
	(set-indent 2)
	(column-enforce-n 80)
	(setq-local js2-basic-offset 2)
  (setq-local js2-strict-missing-semi-warning nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (tide-hl-identifier-mode +1)

    (if (string-match-p "rebelroam" (buffer-file-name))
      (flycheck-add-next-checker 'javascript-standard 'javascript-tide 'append))


  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))

  ;; "Company list override."
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-tide)))

(add-hook 'js2-mode-hook 'activate-js2-mode)
