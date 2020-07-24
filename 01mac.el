;;; 01mac -- summary
;;; Commentary:
;;; Make Emacs play nicer with MacOS.
;;; Code:

;;;;;;;;; GC configuration ;;;;;;;;;;;;;;;;;;;
(setq gc-cons-threshold 50000000)

;;;;;;;;; TRAMP configuration ;;;;;;;;;;;;;;;;
(require 'tramp)
(setq tramp-default-method "ssh")

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "RET") 'newline)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

(defun mac-switch-meta nil
  "Switch meta between Option and Command."
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	)
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      )
    )
  )

;;;;;;;;; Mac binding (fix) ;;;;;;;;;;;;;;;;;;
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(global-set-key (kbd "H-<right>") 'end-of-line)
(global-set-key (kbd "H-<left>") 'beginning-of-line)
(global-set-key (kbd "H-<up>") 'scroll-down) ; WTF is this reverse, I dunno
(global-set-key (kbd "H-<down>") 'scroll-up)

(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper q)] 'kill-emacs)

;;; Helpful key bindings
(global-set-key (kbd "<f1> b") 'describe-bindings) ;; List all key bindings
                                                   ;; there are.

(global-set-key (kbd "C-c \\") 'split-window-right) ;; Split window to the right
(global-set-key (kbd "C-c /") 'split-window-below) ;; Split window to the bottom

;; Move between windows key bindings
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; The same, but without using arrow keys
(global-set-key (kbd "C-c [") 'windmove-left)
(global-set-key (kbd "C-c ]") 'windmove-right)
(global-set-key (kbd "C-c {") 'windmove-up)
(global-set-key (kbd "C-c }") 'windmove-down)

;; Switch to previous and next buffer
(global-set-key (kbd "C-c s <left>") 'previous-buffer)
(global-set-key (kbd "C-c s <right>") 'next-buffer)

;; The same, but without arrow keys.
(global-set-key (kbd "C-c s [") 'previous-buffer)
(global-set-key (kbd "C-c s ]") 'next-buffer)


;; Kill current buffer and window
(global-set-key (kbd "C-c q") 'kill-buffer-and-window)

;; List buffers
(global-set-key (kbd "C-c b") 'ibuffer)

;; Move buffers around with buffer keys
(use-package buffer-move
  :ensure t
  :defer t
  :bind ("C-c m [" . buf-move-left)
        ("C-c m ]" . buf-move-right)
        ("C-c m {" . buf-move-up)
        ("C-c m }" . buf-move-down))


;; Revert without asking
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(global-set-key (kbd "C-c r") 'revert-buffer-no-confirm)

;; Create new terminal
(global-set-key (kbd "<f12>") (lambda ()
                               (interactive)
                                (ansi-term "/bin/zsh" "ANSI-Term : Zsh")))

;#====================== Backup config #==============================
(setq backup-directory-alist
      `((".*" . "~/.emacs_backups/auto-save-list")))
(setq auto-save-file-name-transforms
      `((".*", "~/.emacs_backups/auto-save-list" t)))

(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; Do not create .#foo.file lock files
(setq create-lockfiles nil)

; Enable line numbers and show cursors position
(global-display-line-numbers-mode t)
(column-number-mode t)

;; Turn off sounds
(setq ring-bell-function 'ignore)

;; Enable y/n answers to questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Only warn if a file is bigger than 50 MB when trying to open it
(setq large-file-warning-threshold 50000000)

;; Numbers are arbitrary, but work on a large screen. Default is 160
(setq split-width-threshold 180)

;;;;;;;;;;;;;;;;;;;;;; Shell stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Allow to execute path from shell
(use-package exec-path-from-shell
             :if (memq window-system '(mac ns))
             :ensure t
             :config (add-to-list 'exec-path "/usr/local/bin")
                     (exec-path-from-shell-initialize))


;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-font-size (size)
  "Set font SIZE to X px."
  (interactive "NNew font size: ")
  (set-face-attribute 'default nil :font (format "Hasklig %d" size))
  (set-face-attribute 'mode-line nil :font (format "Hasklig %d" size)))

;;;;;;;;;;;;;;;;;;;;;; Window configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Always start in fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(global-set-key (kbd "C-H-f") 'toggle-fullscreen)

;; Disable meta on right alt (useful for Polish characters)
(setq mac-right-option-modifier nil)

;;; Get rid of bad parts of the windows
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;; Record frequency of different commands. Review them later
(use-package keyfreq
  :defer t
  :ensure t)

(keyfreq-mode t)
(keyfreq-autosave-mode t)

(provide '01mac)
;;; 01mac.el ends here
