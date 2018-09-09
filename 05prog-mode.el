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
(define-key prog-mode-map (kbd "C-d") 'dash-at-point) ;; Jump to dash definition
(define-key prog-mode-map (kbd "C-c c") 'comment-line)
(define-key prog-mode-map (kbd "C-c r") 'align-regexp) ;; Because C-c a is used by ag already.
(define-key prog-mode-map (kbd "C-c i") 'indent-region)

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
