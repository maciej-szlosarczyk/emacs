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
(use-package etags :ensure nil)
(with-eval-after-load 'etags
  (setq tags-revert-without-query t))

;;; Show trailing whitespace and remove whitespace on save
(use-package whitespace :ensure nil)

(with-eval-after-load 'whitespace
  (setq
   ;; Change whitespace style
   whitespace-style #'(face trailing empty)
   ;; Insert newline on save
   require-final-newline 't)

  (add-hook 'prog-mode-hook #'whitespace-mode)
  (add-hook 'text-mode-hook #'whitespace-mode)
  (add-hook 'conf-mode-hook #'whitespace-mode)
  (add-hook 'before-save-hook #'whitespace-cleanup))

(setq-default indent-tabs-mode nil)

;; Use colorful, matching parens
(use-package rainbow-delimiters :ensure t)
(with-eval-after-load 'rainbow-delimiters
  (electric-pair-mode t)
  (show-paren-mode t)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook #'rainbow-delimiters-mode))

;;; Show hex (#aaa) colors as colors
(use-package rainbow-mode :ensure t)
(with-eval-after-load 'rainbow-mode
  (add-hook 'prog-mode-hook #'rainbow-mode)
  (add-hook 'text-mode-hook #'rainbow-mode))

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

(use-package column-enforce-mode :ensure t)
(with-eval-after-load 'column-enforce-mode
  (global-column-enforce-mode t))

;; PCRE to emacs regex translations
(use-package pcre2el :ensure t)

;; Visual regexp
(use-package visual-regexp-steroids :ensure t :requires (pcre2el))
(with-eval-after-load 'visual-regexp-steroids
  (setq vr/engine 'pcre2el))

(provide 'icejam-prog-mode)
;;; icejam-prog-mode.el ends here
