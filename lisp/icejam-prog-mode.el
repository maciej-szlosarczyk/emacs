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
(use-package etags :ensure nil :defer t
  :config
  (setopt tags-revert-without-query t))

;;; Show trailing whitespace and remove whitespace on save
(use-package whitespace :ensure nil
  :hook ((prog-mode . whitespace-mode)
         (text-mode . whitespace-mode)
         (conf-mode . whitespace-mode)
         (before-save . whitespace-cleanup))
  :config
  (setopt
   whitespace-style #'(face trailing empty) ;; New whitespace style
   require-final-newline 't                 ;; Insert newline on save
   ))

(setq-default indent-tabs-mode nil)

;; Use colorful, matching parens
;; Rework the code below to enumerate each hook separately:
(use-package rainbow-delimiters :ensure t :defer t
  :hook ((prog-mode . rainbow-delimiters-mode)
         (text-mode . rainbow-delimiters-mode)
         (elpaca-after-init . electric-pair-mode)
         (elpaca-after-init . show-paren-mode)))

;;; Show hex (#aaa) colors as colors
(use-package rainbow-mode :ensure t :defer t
  :hook ((prog-mode . rainbow-mode)
         (text-mode . rainbow-mode)))

;; Dash integration
(use-package dash-at-point :ensure t :defer t
  :config
  (add-to-list 'dash-at-point-mode-alist '(enh-ruby-mode  . "ruby,rubygems,rails"))
  (add-to-list 'dash-at-point-mode-alist '(elixir-ts-mode . "elixir,hex")))


;; By default, use 2 spaces for indentation
(setopt tab-width 2)
(setopt tab-stop-list (number-sequence tab-width 200 tab-width))

;; Ensure indentation in steps:
(defun icejam-set-indent (step)
  "Set indentation to STEP."
  (interactive "NNumber of columns for one step: ")
  (setq-local tab-width step)
  (setq-local tab-stop-list (number-sequence step 200 step)))

(defun icejam-set-indent-2 () "Set indent to 2." (icejam-set-indent 2))
(defun icejam-set-indent-4 () "Set indent to 4." (icejam-set-indent 4))
(defun icejam-set-indent-8 () "Set indent to 8." (icejam-set-indent 8))

(use-package column-enforce-mode :ensure t :defer t
  :hook (elpaca-after-init . global-column-enforce-mode)
  :config
  (declare-function column-enforce-n 'column-enforce-mode)
  (defun icejam-column-enforce-80 ()
    "Enforce 80 columns."
    (column-enforce-n 80))
  (defun icejam-column-enforce-100 ()
    "Enforce 100 columns."
    (column-enforce-n 100))
  (defun icejam-column-enforce-98 ()
    "Enforce 98 columns."
    (column-enforce-n 98)))

;; PCRE to Emacs regex translations
(use-package pcre2el :ensure t :defer t)

;; Visual regexp
(use-package visual-regexp-steroids :ensure t :after (pcre2el)
  :config
  ;; Use pcre2el for regexes - so that I can use brackets more naturally with
  ;; regexp.
  (setopt vr/engine 'pcre2el))

(provide 'icejam-prog-mode)
;;; icejam-prog-mode.el ends here
