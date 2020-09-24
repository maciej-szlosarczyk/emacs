;;; languages/clojure -- summary
;;; Commentary:
;;; Code:

(require 'pkg/prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require 'pkg/hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package clojure-mode
	:defer t
	:ensure t)

(use-package cider
  :requires clojure-mode
  :commands cider-jack-in
  :defer t
  :ensure t
  :config (setq cider-annotate-completion-function t))

(use-package clj-refactor
	:requires (cider clojure-mode)
	:defer t
	:ensure t)

;; Hydra
(defhydra my-clojure/context-hydra (:color teal :hint nil)
  "
  Clojure actions

   ^Cider^                          ^Actions^
^^^^^^^^-----------------------------------------------------------------------
_j_: Jack in                     _t_: Run loaded test(s)
_f_: Format buffer
_l_: Load buffer
"
  ("q" nil "cancel" :color blue)

  ("j" cider-jack-in)
  ("f" cider-format-buffer)
  ("l" cider-load-buffer)
  ("t" cider-test-run-loaded-tests))

(defun activate-my-clojure-mode ()
  "Goodies for clojure files."
  (set-indent 2) ;; Default indentation of 2 characters
  (column-enforce-n 80)
  (clj-refactor-mode 1)
  (cider-mode 1)
  (setq-local indent-tabs-mode nil)

  (define-key clojure-mode-map (kbd "C-c l") 'my-clojure/context-hydra/body)

  ;; Do not enable paredit for clojure
  ;; (paredit-mode 1)
	;; Do not show separate error window when in REPL
  (setq cider-show-error-buffer 'except-in-repl))

(add-hook 'clojure-mode-hook 'activate-my-clojure-mode)

(defun my-clj-repl-config ()
  "Do not show stacktrace when in REPL."
	(setq-local cider-show-error-buffer 'except-in-repl))

(add-hook 'cider-repl-mode-hook 'my-clj-repl-config)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

(provide 'languages/clojure)
;;; clojure.el ends here
