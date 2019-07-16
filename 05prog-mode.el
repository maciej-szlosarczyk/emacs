;;; Programmers mode

;;; Wrap long lines
(toggle-truncate-lines t)
;;; When pasting/writing over a selection, replace it.
(delete-selection-mode 1)

;; When possible, show code documentation
(global-eldoc-mode 1)

;; Revert tag tables without asking
(setq tags-revert-without-query 1)

;;; Show trailing whitespace and remove whitespace on save
(use-package whitespace
             :commands whitespace-mode
             :ensure t
             :hook (((prog-mode text-mode) . whitespace-mode)
                    (before-save . whitespace-cleanup))
             :init (setq whitespace-style #'(face trailing empty))
                    ;;; Insert newline on save
                    (setq require-final-newline t)
                    ;;; Tabs are spaces and are general at 2. Guide indent
                    ;;; with lines
                    (setq-default indent-tabs-mode nil))

;; Use colorful, matching parens
(use-package rainbow-delimiters
             :commands rainbow-delimiters-mode
             :ensure t
             :hook (((prog-mode text-mode) . rainbow-delimiters-mode))
             :init
             ;;; Match parenthasis (left-right)
             (electric-pair-mode 1))

;;; Show hex colors as colors
(use-package rainbow-mode
             :commands rainbow-mode
             :ensure t
             :hook ((prog-mode text-mode) . rainbow-mode))

(use-package lsp-mode
             :ensure t)

;; Dash integration
(use-package dash-at-point
             :commands dash-at-point
             :ensure t
             :bind (:map prog-mode-map ("C-s C-d" . dash-at-point)
                   :map text-mode-map ("C-s C-d" . dash-at-point))
             :config
             (add-to-list 'dash-at-point-mode-alist
                          ;; Configure lookup for Ruby mode
                          '(enh-ruby-mode . "ruby,rubygems,rails")))


;; Use flycheck globally to check syntax and compile languages
(use-package flycheck
  :commands flycheck-define-checker
  :ensure t
  :defer t
  :config (global-flycheck-mode t))

;; By default, use 2 spaces for indentation
(setq tab-width 2)
(setq tab-stop-list (number-sequence tab-width 200 tab-width))

;; Ensure indentation in steps:
(defun set-indent (step)
  "Set indentation to X STEPs."
  (interactive "NNumber of columns for one step: ")
  (setq-local tab-width step)
  (setq-local tab-stop-list (number-sequence step 200 step)))

(use-package column-enforce-mode
             :ensure t
             :config (global-column-enforce-mode t))
