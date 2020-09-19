;;; javascript -- summary
;;; Commentary:
;;; Code:

(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")
(require '05flycheck "$HOME/.emacs.d/05flycheck.el")
(require '05lsp "$HOME/.emacs.d/05lsp.el")

(use-package js2-mode
  :requires (web-mode company-web lsp-mode lsp-ui)
  :ensure t)

;; Use js2-mode for javascript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;; Use js2-mode for typescript editing
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js2-mode))

(defun activate-js2-mode ()
	"JS2 mode overrides."
	(set-indent 2)

  (when (not (string-match-p ".json" (buffer-file-name)))
    (lsp))

	(column-enforce-n 80)
	(setq-local js2-basic-offset 2)
  (setq-local js2-strict-missing-semi-warning nil)
  (setq-local lsp-eldoc-enable-hover nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)

  (setq-local lsp-eldoc-enable-hover nil)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))

  ;; "Company list override."
  (add-to-list (make-local-variable 'company-backends)
               '(company-yasnippet company-capf)))

(add-hook 'js2-mode-hook 'activate-js2-mode)

(provide 'languages/javascript)
;;; javascript.el ends here
