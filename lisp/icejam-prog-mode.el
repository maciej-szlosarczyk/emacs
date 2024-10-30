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
(use-package etags :ensure nil
  :custom (tags-revert-without-query t "Revert tag tables without asking"))

;;; Show trailing whitespace and remove whitespace on save
(use-package whitespace :ensure nil
  :custom ((whitespace-style #'(face trailing empty) "New whitespace style.")
           (require-final-newline 't "Insert newline on save"))
  :hook ((prog-mode . whitespace-mode)
         (text-mode . whitespace-mode)
         (conf-mode . whitespace-mode)
         (before-save . whitespace-cleanup)))

(setq-default indent-tabs-mode nil)

;; Use colorful, matching parens
;; Rework the code below to enumerate each hook separately:
(use-package rainbow-delimiters :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)
         (text-mode . rainbow-delimiters-mode))
  :config
  (electric-pair-mode t)
  (show-paren-mode t))

;;; Show hex (#aaa) colors as colors
(use-package rainbow-mode :ensure t
  :hook ((prog-mode . rainbow-mode)
         (text-mode . rainbow-mode)))

;; Dash integration
(use-package dash-at-point :ensure t)
(with-eval-after-load 'dash-at-point
  (add-to-list 'dash-at-point-mode-alist '(enh-ruby-mode  . "ruby,rubygems,rails"))
  (add-to-list 'dash-at-point-mode-alist '(elixir-ts-mode . "elixir,hex")))

;; By default, use 2 spaces for indentation
(setq tab-width 2)
(setq tab-stop-list (number-sequence tab-width 200 tab-width))

;; Ensure indentation in steps:
(defun icejam-set-indent (step)
  "Set indentation to STEP."
  (interactive "NNumber of columns for one step: ")
  (setq-local tab-width step)
  (setq-local tab-stop-list (number-sequence step 200 step)))

(use-package column-enforce-mode :ensure t
  :config
  (declare-function global-column-enforce-mode "column-enforce-mode")
  (global-column-enforce-mode t))

;; PCRE to Emacs regex translations
(use-package pcre2el :ensure t)

;; Visual regexp
(use-package visual-regexp-steroids :ensure t :requires (pcre2el)
  :custom (vr/engine 'pcre2el "Use pcre2el for regexes"))

(provide 'icejam-prog-mode)
;;; icejam-prog-mode.el ends here
