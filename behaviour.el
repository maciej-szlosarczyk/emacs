;;; behaviour.el ---  how emacs should behave
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;; Overall behaviour ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist
      `(("" . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups/auto-save" t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; Use Shells variables
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;; remove menu bar and icons
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Open files in the existing emacs window
(setq ns-pop-up-frames nil)

; Enable diff highlights (useful for git)
(global-diff-hl-mode)
(diff-hl-flydiff-mode)
(diff-hl-margin-mode)
(setq diff-hl-side 'right)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

; Add pgp binary
(add-to-list 'exec-path "/usr/local/bin")

; Enable line numbers and show cursors position
(global-linum-mode t)
(column-number-mode 1)
(global-hl-line-mode)

;; Turn off sounds
(setq ring-bell-function 'ignore)

;; Enable y/n answers to questions
(fset 'yes-or-no-p 'y-or-n-p)
;;;;;;;;;;;;;;;;;;;;;;;; code behaviour ;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Add ruler at 80, do not wrap lines (can be overwritten later)
(require 'column-enforce-mode)
(add-hook 'prog-mode-hook 'column-enforce-mode)

;; (setq whitespace-space 'underline)
(toggle-truncate-lines t)

;; Show trailing whitespaces and remove whitespace on save
(require 'whitespace)
(setq-default show-trailing-whitespace t)
(add-hook 'prog-mode-hook 'whitespace-mode)
(setq whitespace-style '(face trailing empty))

(add-hook 'before-save-hook 'delete-trailing-lines)

;; Tabs are spaces and are general at 2. Guide indent with lines
(setq-default indent-tabs-mode nil)

; Insert newline on save
(setq require-final-newline t)

; Add code snippets as in sublime
(yas-global-mode t)

;; Match parenthasis (left-right)
(electric-pair-mode 1)

; Rainbow parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

; Show hex colors as colors
(require 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)

;;; When pasting/writing over a selection, replace it.
(delete-selection-mode 1)

;;;;;;;;;;;;;;;;;;;;;; indentation functions ;;;;;;;;;;;;;;;;;;;;;;
;;; NB! This does not work reliably, using the functions below
(defun set-width (columns)
  "Set line length to X COLUMNS."
  (interactive "NNumber of columns to use: ")
  (setq column-enforce-column columns)
  (column-enforce-mode -1)
  (column-enforce-mode 1))

(defun set-width-99 ()
   "Set line length to 99 columns."
   (interactive)
   (setq column-enforce-column 99)
   (column-enforce-mode -1)
   (column-enforce-mode 1))

(defun set-width-80 ()
   "Set line length to 80 columns."
   (interactive)
   (setq column-enforce-column 80)
   (column-enforce-mode -1)
   (column-enforce-mode 1))

(defun set-width-120 ()
   "Set line length to 120 columns."
   (interactive)
   (setq column-enforce-column 120)
   (column-enforce-mode -1)
   (column-enforce-mode 1))

(defun set-indent (step)
  "Set indentation to X STEPs."
  (interactive "NNumber of columns for one step: ")
  (setq tab-width step)
  (setq tab-stop-list (number-sequence step 200 step)))

;;;;;;;;;;;;;;;;;;;;;;;; additional features  ;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Add completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-limit 10)
(setq company-idle-delay .1)
(setq company-begin-commands '(self-insert-command))
(setq company-selection-wrap-around t)

; Add project management
(require 'projectile)
(projectile-mode)
(setq projectile-enable-caching t)
(setq projectile-globally-ignored-directories (
	append '("node_modules" ".svn") projectile-globally-ignored-directories))
(projectile-mode t)
(require 'helm-projectile)

(with-eval-after-load 'helm-projectile
  (defvar helm-source-file-not-found
    (helm-build-dummy-source
        "Create file"
      :action (lambda (cand) (find-file cand))))
  (add-to-list 'helm-projectile-sources-list helm-source-file-not-found t))

;; Show projectile lists by most recently active
(setq projectile-sort-order (quote recently-active))

;; (add-hook 'projectile-find-file-hook 'projectile-invalidate-cache)

; Use VIM mode
(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode 1)

;; Add magit for git
(require 'evil-magit)

;;; behaviour.el ends here
