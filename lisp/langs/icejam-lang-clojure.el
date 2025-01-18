;;; icejam-lang-clojure.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(declare-function column-enforce-n "column-enforce-mode" (number))
(declare-function icejam-set-indent 'icejam-prog-mode)

(use-package clojure-mode :defer t :ensure t)

(use-package cider
  :requires clojure-mode
  :commands (cider-mode cider-jack-in)
  :defer t
  :ensure t
  :config (setq cider-annotate-completion-function t))

(use-package clj-refactor
	:requires (cider clojure-mode)
	:defer t
	:ensure t)

;; Transient
(transient-define-prefix icejam-lang-cider-context-menu ()
  "Clojure Buffer Commands."
  [""
   ["Cider"
    ("j" "Jack in"     cider-jack-in)
    ("t" "Test"        cider-test-run-loaded-tests)]
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      cider-format-buffer)
    ("l" "Load"        cider-load-buffer)
    ("e" "Show Errors" flymake-show-buffer-diagnostics)]]
  [""
   ("q"  "Quit"        keyboard-quit)])

(defun icejam-lang-activate-clojure-mode ()
  "Goodies for clojure files."
  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (cider-mode 1)

  (define-key clojure-mode-map (kbd "C-c l") 'icejam-lang-cider-context-menu)

  ;; Do not enable paredit for clojure
  ;; (paredit-mode 1)
	;; Do not show separate error window when in REPL
  (setq cider-show-error-buffer 'except-in-repl))

(add-hook 'clojure-mode-hook 'icejam-lang-activate-clojure-mode)

(defun icejam-lang-clojure-repl-config ()
  "Do not show stacktrace when in REPL."
	(setq-local cider-show-error-buffer 'except-in-repl))

(add-hook 'cider-repl-mode-hook 'icejam-lang-clojure-repl-config)
(add-hook 'cider-mode-hook 'cider-enable-flex-completion)

(provide 'icejam-lang-clojure)
;;; icejam-lang-clojure.el ends here
