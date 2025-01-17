;;; javascript -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function lsp-deferred 'lsp-mode)
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)

(use-package js2-mode :ensure t :defer t
  :after (web-mode lsp-mode lsp-ui))

(use-package typescript-ts-mode :ensure nil :defer t)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-ts-mode))

(defun icejam-activate-typescript-ts-mode ()
  "Typescript mode overrides."
  (icejam-set-indent 2)
  (lsp-deferred)
  (column-enforce-n 100))

(add-hook 'typescript-ts-mode-hook 'icejam-activate-typescript-ts-mode)

;; (use-package vue-mode
;;   :ensure t
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

  (icejam-set-lsp-capfs))

(add-hook 'js2-mode-hook 'icejam-activate-js2-mode)

(provide 'icejam-lang-javascript)
;;; icejam-lang-javascript.el ends here
