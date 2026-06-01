;;; icejam-lang-clojure.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(eval-when-compile
  (declare-function column-enforce-n "column-enforce-mode" (number))
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-start-eglot 'icejam-eglot)
  (declare-function lispy-mode 'lispy-mode)
  (declare-function transient-define-prefix 'transient)
  (defvar cider-annotate-completion-function)
  (defvar cider-show-error-buffer)
  (defvar icejam-clojure-lang-menu)
  (defvar icejam-language-transient-alist))

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
(transient-define-prefix icejam-clojure-lang-menu ()
  "Clojure Buffer Commands."
  [""
   ["Cider"
    ("j" "Jack in"     cider-jack-in)
    ("t" "Test"        cider-test-run-loaded-tests)]
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      eglot-format-buffer)
    ("l" "Load"        cider-load-buffer)
    ("e" "Show Errors" flymake-show-buffer-diagnostics)]]
  [""
   ("q"  "Quit"        keyboard-quit)])

(add-to-list
 'icejam-language-transient-alist '(clojure-mode . icejam-clojure-lang-menu))

(defun icejam-lang-activate-clojure-mode ()
  "Goodies for clojure files."
  (icejam-set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 100)
  (cider-mode 1)

  ;; Use lispy mode in Clojure
  (lispy-mode t)

  ;; Use LSP in clojure
  (icejam-set-eglot-capfs)
  (icejam-start-eglot)

	;; Do not show separate error window when in REPL
  (setq cider-show-error-buffer 'except-in-repl))

(add-hook 'clojure-mode-hook 'icejam-lang-activate-clojure-mode)
(add-hook 'edn-mode-hook 'icejam-lang-activate-clojure-mode)

(defun icejam-lang-clojure-repl-config ()
  "Do not show stacktrace when in REPL."
	(setq-local cider-show-error-buffer 'except-in-repl))

(add-hook 'cider-repl-mode-hook 'icejam-lang-clojure-repl-config)
(add-hook 'cider-mode-hook 'cider-enable-flex-completion)

(provide 'icejam-lang-clojure)
;;; icejam-lang-clojure.el ends here
