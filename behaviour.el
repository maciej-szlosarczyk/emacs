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

;; Use smart-mode-line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'dark)

;; NOTE: airline is extremely slow, do not use it
;; (require 'airline-themes)
;; (airline-themes-set-modeline)

;; TODO: Figure out how to load a theme randomly.
;; (load-theme 'ujelly t t)
;; (load-theme 'avk-daylight t t)
(load-theme 'monokai t t)
;; (load-theme 'flatui t t)
(load-theme 'atom-one-dark)
;; (load-theme 'airline-doom-one)
;; (load-theme 'airline-base16-shell-dark)

(if (display-graphic-p)
    (progn
      (enable-theme 'atom-one-dark)
      ;; (enable-theme 'airline-doom-one)
      )

  (progn
    (enable-theme 'monokai)
    ;; (enable-theme 'airline-base16-shell-dark)
    )
  )

;; (setq airline-helm-colors t)
;; (setq airline-cursor-colors t)
;; (setq airline-eshell-colors t)

;; Neotree theme
(setq neo-theme 'arrow)

;; Add mode line icons items
;; (mode-icons-mode)

;; Match parenthasis (left-right)
(electric-pair-mode 1)

; Rainbow parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;; In app mode, use hasklig font
(set-face-attribute 'default nil :font "Hasklig 13")
(set-face-attribute 'mode-line nil :font "Hasklig 12")
(set-face-attribute 'linum nil :font "Hasklig 13")

;;; When pasting/writing over a selection, replace it.
(delete-selection-mode 1)

;; Neotree
;; (require 'neotree)
;; (require 'all-the-icons)
;; (setq neo-window-width 40)
;; ;; (neotree-toggle)
;; (setq projectile-switch-project-action 'neotree-projectile-action)

;;;;;;;;;;;;;;;;;;;;;;;; code behaviour ;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Add ruler at 80, do not wrap lines (can be overwritten later)
(require 'whitespace)
;; (setq whitespace-space 'underline)

(add-hook 'prog-mode-hook 'whitespace-mode)
(toggle-truncate-lines t)

;; Show trailing whitespaces and remove whitespace on save
(setq-default show-trailing-whitespace t)
(setq whitespace-style '(face trailing lines-tail trailing))
(setq whitespace-line-column 80)
(add-hook 'before-save-hook 'delete-trailing-lines)

;; Tabs are spaces and are general at 2. Guide indent with lines
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq tab-stop-list (quote(2 4 6 8 10 12 14 16 20 22 24 26 28 30 32 34 36 38 40
                             42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74
                             76 78 80)))
;; (require 'indent-guide)
;; (indent-guide-global-mode)

; Insert newline on save
(setq require-final-newline t)

; Add code snippets as in sublime
(yas-global-mode t)

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
(require 'evil-magit)

;; ; Change cursor depending on the evil-mode
;; ; (setq evil-insert-state-cursor '(hbar))
;; (unless (display-graphic-p)
;;          (require 'evil-terminal-cursor-changer)
;;          (evil-terminal-cursor-changer-activate) ; or (etcc-on)
;;          )

; Add opacity
;; (set-frame-parameter (selected-frame) 'alpha '(94 . 90))
;; (add-to-list 'default-frame-alist '(alpha . (94 . 90)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Additional loads ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Language specific stuff
(load "~/.emacs.d/ruby.el")
(load "~/.emacs.d/elixir.el")
(load "~/.emacs.d/javascript.el")
;;; behaviour.el ends here
