(use-package js2-mode
  :requires (web-mode company-web)
  :ensure t)

(use-package tide
  :ensure t
  :after (company flycheck)
  :hook ((before-save . tide-format-before-save)))

(use-package lsp-mode
  :ensure t
  :defer t
  :config (setq-default lsp-file-watch-threshold 10000)
  :hook (typescript-mode . lsp))

;; Use js2-mode for javascript editing
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;; Use js2-mode for typescript editing
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

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

(defun activate-typescript-mode ()
  (set-indent 2)
	(column-enforce-n 80))

;; Magic for LSP mode
(with-eval-after-load 'lsp-mode
  ;; enable log only for debug
  (setq lsp-log-io nil)

  ;; use `evil-matchit' instead
  (setq lsp-enable-folding nil)

  ;; no real time syntax check
  (setq lsp-diagnostic-package :none)

  ;; handle yasnippet by myself
  (setq lsp-enable-snippet nil)

  ;; use `company-ctags' only.
  ;; Please note `company-lsp' is automatically enabled if installed
  (setq lsp-enable-completion-at-point nil)

  ;; turn off for better performance
  (setq lsp-enable-symbol-highlighting nil)

  ;; use ffip instead
  (setq lsp-enable-links nil)

  ;; auto restart lsp
  (setq lsp-restart 'auto-restart)

  ;; @see https://github.com/emacs-lsp/lsp-mode/pull/1498 and code related to auto configure.
  ;; Require clients could be slow.
  ;; I only load `lsp-clients' because it includes the js client which I'm interested
  (setq lsp-client-packages '(lsp-clients))

  ;; don't scan 3rd party javascript libraries
  (push "[/\\\\][^/\\\\]*\\.\\(json\\|html\\|jade\\)$" lsp-file-watch-ignored) ; json

  ;; don't ping LSP lanaguage server too frequently
  (defvar lsp-on-touch-time 0)
  (defadvice lsp-on-change (around lsp-on-change-hack activate)
    ;; don't run `lsp-on-change' too frequently
    (when (> (- (float-time (current-time))
                lsp-on-touch-time) 30) ;; 30 seconds
      (setq lsp-on-touch-time (float-time (current-time)))
      ad-do-it)))

(defun my-connect-lsp (&optional no-reconnect)
  "Connect lsp server.  If NO-RECONNECT is t, don't shutdown existing lsp connection."
  (interactive "P")
  (when (and (not no-reconnect)
             (fboundp 'lsp-disconnect))
    (lsp-disconnect))
  (when (and buffer-file-name
             (not (member (file-name-extension buffer-file-name)
                          '("json"))))
    (unless (and (boundp 'lsp-mode) lsp-mode)
      (if (derived-mode-p 'js2-mode) (setq-local lsp-enable-imenu nil))
      (lsp-deferred))))


(add-hook 'typescript-mode 'activate-typescript-mode)
(add-hook 'typescript-mode 'my-connect-lsp)
