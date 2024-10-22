;;; javascript -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-flycheck)
(require 'icejam-lsp)

(use-package js2-mode
  :requires (web-mode company-web lsp-mode lsp-ui)
  :straight t)

(use-package typescript-mode :straight t)

;; (use-package vue-mode
;;   :straight t
;;   :defer t)

;; Use js2-mode for javascript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

(defun icejam-activate-js2-mode ()
	"JS2 mode overrides."
	(icejam-set-indent 2)

  (when (not (string-match-p ".json" (buffer-file-name)))
    (lsp-deferred))

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
               '(company-capf company-yasnippet)))

(add-hook 'js2-mode-hook 'icejam-activate-js2-mode)

(provide 'icejam-lang-javascript)
;;; icejam-lang-javascript.el ends here
