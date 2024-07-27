;;; languages/clojure -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-transient)

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
(transient-define-prefix +custom-lang-clojure/cider-context-menu ()
  "Clojure Buffer Commands."
  [""
   ["Cider"
    ("j" "Jack in"     cider-jack-in)
    ("t" "Test"        cider-test-run-loaded-tests)]
   ["Buffer"
    ("r" "Reload"      revert-buffer-no-confirm)
    ("f" "Format"      cider-format-buffer)
    ("l" "Load"        cider-load-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q"  "Quit"        keyboard-quit)])

(defun +custom-lang-clojure/activate-clojure-mode ()
  "Goodies for clojure files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (clj-refactor-mode 1)
  (cider-mode 1)
  (setq-local indent-tabs-mode nil)

  (define-key
    clojure-mode-map (kbd "C-c l") '+custom-lang-clojure/cider-context-menu)

  ;; Do not enable paredit for clojure
  ;; (paredit-mode 1)
	;; Do not show separate error window when in REPL
  (setq cider-show-error-buffer 'except-in-repl))

(add-hook 'clojure-mode-hook '+custom-lang-clojure/activate-clojure-mode)

(defun +custom-lang-clojure/clj-repl-config ()
  "Do not show stacktrace when in REPL."
	(setq-local cider-show-error-buffer 'except-in-repl))

(add-hook 'cider-repl-mode-hook '+custom-lang-clojure/clj-repl-config)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

(provide '+custom-lang-clojure)
;;; clojure.el ends here
