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
  (setopt whitespace-style #'(face trailing empty)) ;; New whitespace style
  (setopt require-final-newline 't)                 ;; Insert newline on save
  )

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
(use-package dash-at-point :ensure t :defer t)
(with-eval-after-load 'dash-at-point
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

(use-package column-enforce-mode :ensure t :defer t
  :hook (elpaca-after-init . global-column-enforce-mode))

;; PCRE to Emacs regex translations
(use-package pcre2el :ensure t :defer t)

;; Visual regexp
(use-package visual-regexp-steroids :ensure t :after (pcre2el)
  :config
  (setopt vr/engine 'pcre2el) ;; Use pcre2el for regexes
  )

(provide 'icejam-prog-mode)
;;; icejam-prog-mode.el ends here
