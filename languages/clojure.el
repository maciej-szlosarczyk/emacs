(use-package clojure-mode
	:defer t
	:ensure t)

(use-package cider
  :requires clojure-mode
  :commands cider-jack-in
  :defer t
  :ensure t)

(use-package clj-refactor
	:requires (cider clojure-mode)
	:defer t
	:ensure t)

(use-package paredit
	:defer t
	:ensure t)

(setq-local indent-tabs-mode nil)

(defun activate-my-clojure-mode ()
  "Goodies for clojure files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (clj-refactor-mode 1)
  (cider-mode 1)
  (paredit-mode 1)
	;; Do not show separate error window when in REPL
  (setq cider-show-error-buffer 'except-in-repl))

(add-hook 'clojure-mode-hook 'activate-my-clojure-mode)

(defun my-clj-repl-config ()
	(setq-local cider-show-error-buffer 'except-in-repl))

(add-hook 'cider-repl-mode-hook 'my-clj-repl-config)
