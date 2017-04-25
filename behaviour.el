;;; behaviour.el ---  how emacs should behave
;;; Commentary:
;;; Code:
;;; Safely save garbage files into emacs.d

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

;;; When pasting/writing over a selection, replace it.
(delete-selection-mode 1)

;;;;;;;;;;;;;;;;;;;;;; indentation functions ;;;;;;;;;;;;;;;;;;;;;;
(defun set-line-99 ()
  "Set line length to 99 columns."
  (interactive)
  (setq column-enforce-column 99)
  (column-enforce-mode -1)
  (column-enforce-mode 1))

(defun set-line-80 ()
  "Set line length to 80 columns."
  (interactive)
  (setq column-enforce-column 80)
  (column-enforce-mode -1)
  (column-enforce-mode 1))

(defun set-line-120 ()
  "Set line length to 120 columns."
  (interactive)
  (setq column-enforce-column 120)
  (column-enforce-mode -1)
  (column-enforce-mode 1))

(defun set-tab-4 ()
  "Set tab length to 4 spaces."
  (interactive)
  (setq tab-width 4)
  (setq tab-stop-list (quote(4 8 12 16 24 28 32 36 40 44 48 52 56 60 64 68 72 76
                               80 84 88 92 96 100 104 108 112 116 120))))

(defun set-tab-2 ()
  "Set tab length to 2 spaces."
  (interactive)
  (setq tab-width 2)
  (setq tab-stop-list (quote(2 4 6 8 10 12 14 16 20 22 24 26 28 30 32 34 36 38
                               40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70
                               72 74 76 78 80 82 84 86 88 90 92 94 96 98 100 102
                               104 106 108 110 112 114 116 118 120))))

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

; Use VIM mode
(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode 1)

;; Add magit for git
(require 'evil-magit)

;; Remove unused buffers every 2 hours
(require 'midnight)

;;kill buffers if they were last disabled more than this seconds ago
(setq clean-buffer-list-delay-special 900)

(defvar clean-buffer-list-timer nil
  "Stores 'clean-buffer-list timer' if there is one.
You can disable `clean-buffer-list' by (cancel-timer clean-buffer-list-timer)."
  )

;; run clean-buffer-list every 2 hours
(setq clean-buffer-list-timer (run-at-time t 7200 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
(setq clean-buffer-list-kill-regexps '("^.*$"))

;; keep these buffer untouched
;; prevent append multiple times
(defvar clean-buffer-list-kill-never-buffer-names-init
  clean-buffer-list-kill-never-buffer-names
  "Init value for `clean-buffer-list-kill-never-buffer-names'.")
(setq clean-buffer-list-kill-never-buffer-names
      (append
       '("*Messages*" "*cmd*" "*scratch*" "*w3m*" "*w3m-cache*" "*Inferior Octave*")
       clean-buffer-list-kill-never-buffer-names-init))

;; prevent append multiple times
(defvar clean-buffer-list-kill-never-regexps-init
  clean-buffer-list-kill-never-regexps
  "Init value for `clean-buffer-list-kill-never-regexps'.")
;; append to *-init instead of itself
(setq clean-buffer-list-kill-never-regexps
      (append '("^\\*EMMS Playlist\\*.*$")
	      clean-buffer-list-kill-never-regexps-init))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Additional loads ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/languages.el")
;;; behaviour.el ends here
