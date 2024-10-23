;;; icejam-prog-mode.el -- summary -*- lexical-binding: t; -*-
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
  :ensure nil
  :defer t
  :hook (((prog-mode text-mode conf-mode) . whitespace-mode)
         (before-save . whitespace-cleanup))
  :config
  (setq whitespace-style #'(face trailing empty)
;;; Insert newline on save
        require-final-newline 't))

(setq-default indent-tabs-mode nil)

;; Use colorful, matching parens
(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :ensure t
  :defer t
  :hook (((prog-mode text-mode) . rainbow-delimiters-mode))
  :init
  ;;; Match parenthasis (left-right)

  (electric-pair-mode t)
  (show-paren-mode t))

;;; Show hex (#aaa) colors as colors
(use-package rainbow-mode
  :commands rainbow-mode
  :ensure t
  :hook ((prog-mode text-mode) . rainbow-mode))

;; Dash integration
(use-package dash-at-point
  :commands dash-at-point
  :ensure t
  :defer t
  :config
  (add-to-list 'dash-at-point-mode-alist
               '(enh-ruby-mode  . "ruby,rubygems,rails"))
  (add-to-list 'dash-at-point-mode-alist
               '(elixir-ts-mode . "elixir,hex")))

;; By default, use 2 spaces for indentation
(setq tab-width 2)
(setq tab-stop-list (number-sequence tab-width 200 tab-width))

;; Ensure indentation in steps:
(defun icejam-set-indent (step)
  "Set indentation to STEP."
  (interactive "NNumber of columns for one step: ")
  (setq-local tab-width step)
  (setq-local tab-stop-list (number-sequence step 200 step)))

(use-package column-enforce-mode
  :ensure t
  :defer t
  :config (global-column-enforce-mode t))

;; PCRE to emacs regex translations
(use-package pcre2el :ensure t)

;; Visual regexp
(use-package visual-regexp-steroids
  :ensure t
  :requires (pcre2el)
  :config (setq vr/engine 'pcre2el))

(provide 'icejam-prog-mode)
;;; icejam-prog-mode.el ends here
