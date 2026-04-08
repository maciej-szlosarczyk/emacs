;;; pkg/base.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; pkg/base defines basic packages and environment.

;;; Code:

;;;;;;;; Stolen from Doom Emacs. ;;;;;;;;;;;;;
;; Update emacs less often
(setopt idle-update-delay 1.0)

;; Prefer newer byte-compiled code
(setopt load-prefer-newer t)

;; Disable bidirectional text rendering for a modest performance boost. I've set
;; this to `nil' in the past, but the `bidi-display-reordering's docs say that
;; is an undefined state and suggest this to be just as good:
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right
              bidi-inhibit-bpa t)

;; Skip fontification when you are typing
(setopt redisplay-skip-fontification-on-input t)

;; Reduce rendering/line scan work for Emacs by not rendering cursors or regions
;; in non-focused windows.
(setq-default cursor-in-non-selected-windows nil)
(setopt highlight-nonselected-windows nil)

;; More performant rapid scrolling over unfontified regions. May cause brief
;; spells of inaccurate syntax highlighting right after scrolling, which should
;; quickly self-correct.
(setopt fast-but-imprecise-scrolling t)

;; Trust local folder
(setopt trusted-content '("~/.emacs.d/" "~/Development/"))

;;;;;;;;; TRAMP configuration ;;;;;;;;;;;;;;;;
(use-package tramp :ensure nil :defer 5
  :config
  (setopt tramp-default-method "ssh"))

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "RET") 'newline)

;;;;;;;;; Easy copying of data ;;;;;;;;;;;;;;;
(use-package easy-kill :ensure t
  :bind ([remap kill-ring-save] . easy-kill))

;; Move buffers around with buffer keys
(use-package buffer-move :ensure t :defer t)

;; Garbage collection magic hack
(use-package gcmh :ensure t :defer t
  :commands (gcmh-mode)
  :hook ((elpaca-after-init . (lambda () (gcmh-mode t))))
  :config
  (setopt gcmh-verbose nil) ;; Do not log GC messages
  (setopt gcmh-idle-delay 'auto) ;; Compute GC delay based on gcmh-auto-idle-delay-factor
  (setopt gcmh-auto-idle-delay-factor 10) ;; Original value was 10
  (setopt gcmh-high-cons-threshold (* 256 1024 1024)))

;; #====================== Backup config #==============================
(setopt
 backup-directory-alist `((".*" . "~/.emacs.d/backups/auto-save-list"))
 auto-save-file-name-transforms `((".*" ,"~/.emacs.d/backups/auto-save-list" t))
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 10
 kept-old-versions 5
 version-control t)

;; Do not create .#foo.file lock files
(setopt create-lockfiles nil)

;; Enable line numbers and show cursors position
(dolist (mode '(prog-mode-hook
                text-mode-hook
                conf-mode-hook))
  (add-hook mode 'display-line-numbers-mode)
  ;; Highlight current line.
  (add-hook mode 'hl-line-mode))

;; (global-display-line-numbers-mode t)
(column-number-mode t)

;; Turn off sounds
(setopt ring-bell-function 'ignore)

;; Enable y/n answers to questions
(setopt use-short-answers t)

;; Only warn if a file is bigger than 50 MB when trying to open it
(setopt large-file-warning-threshold 50000000)

;; Numbers are arbitrary, but work on a large screen. Default is 160
(setopt split-width-threshold 190)

;;;;;;;;;;;;;;;;;;;;;; Shell stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Disable warning related to PATH on startup
(defvar exec-path-from-shell-check-startup-files nil)

;; Allow to execute path from shell
(use-package exec-path-from-shell
  ;; :if (memq window-system '(x mac ns))
  :ensure t
  :defer t
  :hook ((elpaca-after-init . exec-path-from-shell-initialize))
  :config
  (declare-function exec-path-from-shell-initialize "exec-path-from-shell")
  (add-to-list 'exec-path "/usr/local/bin")
  (dolist (var '("DEFT_PATH"
                 "LANG"
                 "LC_CTYPE"
                 "CLAUDE_CODE_USE_VERTEX"
                 "CLOUD_ML_REGION"
                 "ANTHROPIC_VERTEX_PROJECT_ID"
                 "VERTEX_REGION_CLAUDE_3_5_HAIKU"
                 "VERTEX_REGION_CLAUDE_3_5_SONNET"
                 "VERTEX_REGION_CLAUDE_3_7_SONNET"
                 "VERTEX_REGION_CLAUDE_4_0_OPUS"
                 "VERTEX_REGION_CLAUDE_4_0_SONNET"
                 "VERTEX_REGION_CLAUDE_4_1_OPUS"
                 "ANTHROPIC_MODEL"))
    (add-to-list 'exec-path-from-shell-variables var)))

(use-package direnv :ensure t :defer t
  :hook ((elpaca-after-init . direnv-mode)))

;; Draw underline lower
(setopt x-underline-at-descent-line t)

;;; Get rid of bad parts of the windows
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setopt indicate-buffer-boundaries nil
        indicate-empty-lines nil)

;;;;;;;;;;;;;;;;; Treemacs
(eval-when-compile (defvar icejam-keys-mode-map))

(use-package treemacs :ensure t :defer t
  :hook ((elpaca-after-init . treemacs-follow-mode)
         (elpaca-after-init . treemacs-project-follow-mode))
  :commands (treemacs-follow-mode treemacs-project-follow-mode treemacs)
  :bind (:map icejam-keys-mode-map ([(hyper b)] . treemacs))
  :config (setopt treemacs-tag-follow-delay 1.0))

(use-package treemacs-all-the-icons :ensure t :defer t
  :requires (treemacs)
  :commands (treemacs-load-theme)
  :config (treemacs-load-theme "all-the-icons"))

;;;;;;;;;;;;;;;;; Record frequency of different commands. Review them later
(use-package keyfreq :ensure t :defer t
  :hook ((elpaca-after-init . keyfreq-mode)
         (elpaca-after-init . keyfreq-autosave-mode))
  :config
  (setopt keyfreq-file (concat user-emacs-directory "emacs.keyfreq")))

;;;;;;;;;;;;;;;;; Show hints about key combinations
(use-package which-key :ensure nil :defer t
  :hook ((elpaca-after-init . which-key-mode))
  :config
  (setopt which-key-idle-delay 0.2))

;;;;;;;;;;;;;;;;; Use C-n to create a new line
(setopt next-line-add-newlines t)

(provide 'icejam-base)
;;; icejam-base.el ends here
