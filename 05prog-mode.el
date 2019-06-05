;;; Programmers mode

;;; Wrap long lines
(toggle-truncate-lines t)

;;; Show trailing whitespace and remove whitespace on save
(require 'whitespace)
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'text-mode-hook 'whitespace-mode)
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
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)

;;; Show hex colors as colors
(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'text-mode-hook 'rainbow-mode)
(require 'lsp-mode)

;;; When pasting/writing over a selection, replace it.
(delete-selection-mode 1)

;; Dash
(define-key prog-mode-map (kbd "C-d") 'dash-at-point) ;; Jump to dash definition
(define-key text-mode-map (kbd "C-d") 'dash-at-point) ;; Jump to dash definition
(add-to-list
 'dash-at-point-mode-alist
 '(enh-ruby-mode . "ruby,rubygems,rails")) ;; Configure lookup for Ruby mode

;; When possible, show code documentation
(global-eldoc-mode 1)

;; Revert tags automatically
(setq tags-revert-without-query 1)

;; Use flycheck globally to check syntax and compile languages
(global-flycheck-mode 1)

;; Function for definiting indentation
(defun set-indent (step)
  "Set indentation to X STEPs."
  (interactive "NNumber of columns for one step: ")
  (setq tab-width step)
  (setq tab-stop-list (number-sequence step 200 step)))

;; Enforce column width by number
(global-column-enforce-mode 1)
