;;; icejam-lang-clojure.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-transient)

(declare-function column-enforce-n "column-enforce-mode" (number))

(use-package clojure-mode :defer t :straight t)

(use-package cider
  :requires clojure-mode
  :commands cider-jack-in
  :defer t
  :straight t
  :config (setq cider-annotate-completion-function t))

(use-package clj-refactor
	:requires (cider clojure-mode)
	:defer t
	:straight t)

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
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q"  "Quit"        keyboard-quit)])

(defun icejam-lang-activate-clojure-mode ()
  "Goodies for clojure files."
  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (cider-mode 1)
  (setq-local indent-tabs-mode nil)

  (define-key
    clojure-mode-map (kbd "C-c l") 'icejam-lang-cider-context-menu)

  ;; Do not enable paredit for clojure
  ;; (paredit-mode 1)
	;; Do not show separate error window when in REPL
  (setq cider-show-error-buffer 'except-in-repl))

(add-hook 'clojure-mode-hook 'icejam-lang-activate-clojure-mode)

(defun icejam-lang-clojure-repl-config ()
  "Do not show stacktrace when in REPL."
	(setq-local cider-show-error-buffer 'except-in-repl))

(add-hook 'cider-repl-mode-hook 'icejam-lang-clojure-repl-config)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

(provide 'icejam-lang-clojure)
;;; icejam-lang-clojure.el ends here
