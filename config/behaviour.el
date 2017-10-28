;;; behaviour.el ---  how emacs should behave
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;; Overall behaviour ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist
      `((".*" . "~/.emacs_backups/auto-save-list")))
(setq auto-save-file-name-transforms
      `((".*", "~/.emacs_backups/auto-save-list" t)))

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
(require 'diff-hl)

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
;; (global-hl-line-mode)

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

;; Show trailing whitespace and remove whitespace on save
(require 'whitespace)
(add-hook 'prog-mode-hook 'whitespace-mode)
(setq whitespace-style '(face trailing empty))

(add-hook 'before-save-hook 'delete-trailing-lines)
(add-hook 'before-save-hook 'whitespace-cleanup) ; Cleanup whitespace on save

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

;;;;;;;;;;;;;;;;;;;;;; Shell stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


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

(defun set-width-79 ()
   "Set line length to 79 columns."
   (interactive)
   (setq column-enforce-column 79)
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
(setq company-tooltip-limit 30)
(setq company-tooltip-minimum-width 40)
(setq company-idle-delay .1)
(setq company-begin-commands '(self-insert-command))
(setq company-selection-wrap-around t)

;; Set up default backends (overriden for specific languages)
(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         company-yasnippet
         )
        (company-abbrev company-dabbrev)
        ))

;; Test, I do not know what it does yet.
(setq company-tooltip-align-annotations t)

;; Do not required match to continue typing
(setq company-require-match 'never)

; Use VIM mode
(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode 1)

;; Add magit for git
(require 'evil-magit)


;; Additional configuration for flycheck.
(require 'flycheck)
(setq flycheck-highlighting-mode 'lines)

;;;;;;;;;;;;;;;;;;;;;;;; Projectile  ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'projectile)
(projectile-mode)


(defun projectile-regenerate-tags-if-exist ()
  "Only regenerate tags if a tag file is present in the folder."
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (when (or (file-exists-p (expand-file-name "TAGS"))
              (file-exists-p (expand-file-name projectile-tags-file-name)))
      (projectile-regenerate-tags))))

(setq projectile-enable-caching t)

;; Always create a new tag table list and reload without asking
(setq tags-revert-without-query t)
(setq tags-add-tables nil)

;; Run the tags if project was changed
(add-hook 'projectile-after-switch-project-hook
          'projectile-regenerate-tags-if-exist)

;; Show projectile lists by most recently active
(setq projectile-sort-order (quote recently-active))

(setq projectile-globally-ignored-directories
      (append '("node_modules" ".svn") projectile-globally-ignored-directories))

(require 'helm-projectile)

;;; behaviour.el ends here
