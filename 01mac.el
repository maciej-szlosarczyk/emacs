;;;;;;;;; GC configuration ;;;;;;;;;;;;;;;;;;;
(setq gc-cons-threshold 50000000)


;;;;;;;;; TRAMP configuration ;;;;;;;;;;;;;;;;
(setq tramp-default-method "ssh")

;;;;;;;;; Emacs bindings ;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "RET") 'newline)

;;;;;;;;; Mac binding (fix) ;;;;;;;;;;;;;;;;;;
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<up>") 'scroll-down) ; WTF is this reverse, I dunno
(global-set-key (kbd "s-<down>") 'scroll-up)

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

;; Switch to previous and next buffer
(global-set-key (kbd "C-c w <left>") 'previous-buffer)
(global-set-key (kbd "C-c w <right>") 'next-buffer)

;; Kill current buffer and window
(global-set-key (kbd "C-c q") 'kill-buffer-and-window)

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

; Enable line numbers and show cursors position
(global-display-line-numbers-mode t)
(column-number-mode 1)

;; Turn off sounds
(setq ring-bell-function 'ignore)

;; Enable y/n answers to questions
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;; Shell stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Add pgp binary
(add-to-list 'exec-path "/usr/local/bin")

; Use Shells variables
(when (memq window-system '(mac ns))
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

(toggle-fullscreen)


;; Disable meta on right alt (useful for Polish characters)
(setq ns-right-alternate-modifier nil)

;;; Get rid of bad parts of the windows
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;; Record frequency of different commands. Review them later
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
