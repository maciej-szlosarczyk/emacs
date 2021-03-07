;;; pkg/prog-mode -- summary
;;; Commentary:
;;; Code:

;;; Wrap long lines
(toggle-truncate-lines t)

;;; When pasting/writing over a selection, replace it.
(delete-selection-mode t)

;; When possible, show code documentation
(global-eldoc-mode t)

;; Revert tag tables without asking
(require 'etags)
(setq tags-revert-without-query t)

;;; Show trailing whitespace and remove whitespace on save
(use-package whitespace
  :commands whitespace-mode
  :straight t
  :defer t
  :hook (((prog-mode text-mode conf-mode) . whitespace-mode)
         (before-save . whitespace-cleanup))
  :config
  (setq whitespace-style #'(face trailing empty newline)
        ;;; Insert newline on save
        require-final-newline 't))

(setq-default indent-tabs-mode nil)

;; Use colorful, matching parens
(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :straight t
  :defer t
  :hook (((prog-mode text-mode) . rainbow-delimiters-mode))
  :init
  ;;; Match parenthasis (left-right)
  (electric-pair-mode t)
  (show-paren-mode t))

;;; Show hex (#aaa) colors as colors
(use-package rainbow-mode
  :commands rainbow-mode
  :straight t
  :hook ((prog-mode text-mode) . rainbow-mode))

;; Dash integration
(use-package dash-at-point
  :commands dash-at-point
  :straight t
  :defer t
  :bind (:map prog-mode-map ("C-s C-d" . dash-at-point)
              :map text-mode-map ("C-s C-d" . dash-at-point))
  :config
  (add-to-list 'dash-at-point-mode-alist
               ;; Configure lookup for Ruby mode
               '(enh-ruby-mode . "ruby,rubygems,rails")))

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
  :straight t
  :defer t
  :config (global-column-enforce-mode t))

;; Vim-like regex replace with preview in buffer.
(use-package visual-regexp
  :straight t
  :defer t)

(provide '+custom-pkg-prog-mode)
;;; prog-mode ends here
