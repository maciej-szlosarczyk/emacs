;;; pkg/base.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; pkg/base defines basic packages and environment.

;;; Code:

;;;;;;;; Other optimizations ;;;;;;;;;;;;;;;;;
;;;;;;;; Stolen from Doom Emacs. ;;;;;;;;;;;;;

;; Update emacs less often
(setq idle-update-delay 1.0)

;; Disable bidirectional text rendering for a modest performance boost. I've set
;; this to `nil' in the past, but the `bidi-display-reordering's docs say that
;; is an undefined state and suggest this to be just as good:
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

;; Reduce rendering/line scan work for Emacs by not rendering cursors or regions
;; in non-focused windows.
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; More performant rapid scrolling over unfontified regions. May cause brief
;; spells of inaccurate syntax highlighting right after scrolling, which should
;; quickly self-correct.
(setq fast-but-imprecise-scrolling t)

;;;;;;;;; TRAMP configuration ;;;;;;;;;;;;;;;;
(require 'tramp)
(setq tramp-default-method "ssh")

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "RET") 'newline)

;;;;;;;;; Easy copying of data ;;;;;;;;;;;;;;;
(use-package easy-kill :straight t :defer t
  :config (global-set-key [remap kill-ring-save] 'easy-kill))

;; Move buffers around with buffer keys
(use-package buffer-move
  :straight t
  :defer t
  :bind ("C-c m [" . buf-move-left)
        ("C-c m ]" . buf-move-right)
        ("C-c m {" . buf-move-up)
        ("C-c m }" . buf-move-down))

;; #====================== Backup config #==============================
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups/auto-save-list")))
(setq auto-save-file-name-transforms
      `((".*", "~/.emacs.d/backups/auto-save-list" t)))

(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; Do not create .#foo.file lock files
(setq create-lockfiles nil)

;; Enable line numbers and show cursors position
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)
;; (global-display-line-numbers-mode t)
(column-number-mode t)

;; Turn off sounds
(setq ring-bell-function 'ignore)

;; Enable y/n answers to questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Only warn if a file is bigger than 50 MB when trying to open it
(setq large-file-warning-threshold 50000000)

;; Numbers are arbitrary, but work on a large screen. Default is 160
(setq split-width-threshold 180)

;;;;;;;;;;;;;;;;;;;;;; Tree sitter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package tree-sitter :straight t)
(use-package tree-sitter-langs :straight t :requires (tree-sitter))
(use-package tree-sitter-indent :straight t)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)

;;;;;;;;;;;;;;;;;;;;;; Shell stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Disable warning related to PATH on startup
(defvar exec-path-from-shell-check-startup-files nil)

;; Allow to execute path from shell
(use-package exec-path-from-shell
             :if (memq window-system '(x mac ns))
             :straight t
             :config (add-to-list 'exec-path "/usr/local/bin")
             (exec-path-from-shell-initialize))

(use-package direnv :straight t :config (direnv-mode))
;; (use-package shadowenv :straight t :config (shadowenv-global-mode))

;; Draw underline lower
(setq x-underline-at-descent-line t)

;;; Get rid of bad parts of the windows
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq indicate-buffer-boundaries nil
      indicate-empty-lines nil)

;;;;;;;;;;;;;;;;; Treemacs
(use-package treemacs :straight t :defer t)
(use-package treemacs-all-the-icons :defer t :requires (treemacs) :straight t
  :config
  (treemacs-load-theme "all-the-icons")
  (treemacs-project-follow-mode t))

;;;;;;;;;;;;;;;;; Record frequency of different commands. Review them later
(use-package keyfreq
  :defer t
  :straight t
  :config
  (keyfreq-mode t)
  (keyfreq-autosave-mode t))

;;;;;;;;;;;;;;;;; Show hints about key combinations
(use-package which-key
  :defer t
  :straight t
  :config (which-key-mode t))

;;;;;;;;;;;;;;;;; Use C-n to create a new line
(setq next-line-add-newlines t)

;;;;;;;;;;;;;;;;; Speed up long line display by disabling bidirectional text
(setq-default bidi-paragraph-direction 'left-to-right
              bidi-inhibit-bpa t)

(provide '+custom-pkg-base)
;;; base.el ends here
