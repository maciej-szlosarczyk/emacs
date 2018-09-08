;;; Programmers mode

;;; Wrap long lines
(toggle-truncate-lines t)

;;; Show trailing whitespace and remove whitespace on save
(require 'whitespace)
(add-hook 'prog-mode-hook 'whitespace-mode)
(setq whitespace-style '(face trailing empty))

;;; Cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;;; Tabs are spaces and are general at 2. Guide indent with lines
(setq-default indent-tabs-mode nil)

;;; Insert newline on save
(setq require-final-newline t)

;;; Match parenthasis (left-right)
(electric-pair-mode 1)

;;; Rainbow parenthesis
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;; Show hex colors as colors
(add-hook 'prog-mode-hook 'rainbow-mode)

;;; When pasting/writing over a selection, replace it.
(delete-selection-mode 1)

;; Key bindings
(evil-leader/set-key "cl" 'evilnc-comment-or-uncomment-lines) ;; Comment lines
(evil-leader/set-key "al" 'align-regexp)                      ;; Align code to some regexp
(evil-leader/set-key "ir" 'indent-region)                     ;; Indent selected region
(evil-leader/set-key "d" 'dash-at-point)                      ;; Jump to dash definition

;; When possible, show code documentation
(global-eldoc-mode 1)

;; Function for definiting indentation
(defun set-indent (step)
  "Set indentation to X STEPs."
  (interactive "NNumber of columns for one step: ")
  (setq tab-width step)
  (setq tab-stop-list (number-sequence step 200 step)))

;; Enforce column width by number
(global-column-enforce-mode 1)
