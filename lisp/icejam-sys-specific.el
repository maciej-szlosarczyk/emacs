;;; sys-specific -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Make Emacs play nicer with specific operating systems
;;; Code:

(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-BSD (eq system-type 'berkeley-unix))
(defconst IS-GNU (eq system-type 'gnu/linux))

(eval-when-compile (defvar icejam-keys-mode-map))

(defun icejam-function-delete-window ()
  "Kill a window."
  (interactive) (delete-window))

;; Mac-specific config
(if IS-MAC
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'hyper)

      (defun icejam-mac-switch-meta nil
        "Switch meta between Option and Command."
        (interactive)
        (if (eq mac-option-modifier nil)
            (progn
              (setq mac-option-modifier 'meta)
              (setq mac-command-modifier 'hyper))
          (progn
            (setq mac-option-modifier nil)
            (setq mac-command-modifier 'meta))))

      ;; Mac binding (fix)
      (keymap-set icejam-keys-mode-map "H-<right>" #'end-of-line)
      (keymap-set icejam-keys-mode-map "H-<left>" #'beginning-of-line)
      (keymap-set icejam-keys-mode-map "H-<up>" #'scroll-down) ; WTF is this reverse, I dunno
      (keymap-set icejam-keys-mode-map "H-<down>" #'scroll-up)

      ;; Use CMD bindings that you know from the operating system
      (keymap-set icejam-keys-mode-map "H-a" #'mark-whole-buffer) ;; Select all
      (keymap-set icejam-keys-mode-map "H-v" #'yank) ;; Paste
      (keymap-set icejam-keys-mode-map "H-x" #'kill-region) ;; Cut
      (keymap-set icejam-keys-mode-map "H-c" #'kill-ring-save) ;; Copy
      (keymap-set icejam-keys-mode-map "H-s" #'save-buffer) ;; Save
      (keymap-set icejam-keys-mode-map "H-z" #'undo) ;; Undo
      (keymap-set icejam-keys-mode-map "H-Z" #'undo-redo) ;; Redo
      (keymap-set icejam-keys-mode-map "H-q" #'kill-emacs) ;; Close emacs
      (keymap-set icejam-keys-mode-map "H-w" #'icejam-function-delete-window) ;; Close window

      ;; And then some extras
      (keymap-set icejam-keys-mode-map "H-l" #'goto-line) ;; Goto Line
      ;; Disable meta on right alt (useful for Polish characters)
      ;; (setq mac-right-option-modifier nil)

      ;; Allow for fullscreen frames without gaps
      (setq frame-resize-pixelwise t)))

(defun icejam-switch-right-left-alt ()
  "Set keyboard to das keyboard."
  (interactive)
  (if (eq mac-right-option-modifier nil)
      (progn
        (setq mac-right-option-modifier 'meta)
        (setq mac-option-modifier nil))
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-right-option-modifier nil))))

;; Linux-specific config
(if IS-GNU
    (progn
      ;; Save and undo
      (keymap-set icejam-keys-mode-map (kbd "s-s") #'save-buffer)
      (keymap-set icejam-keys-mode-map (kbd "s-z") #'undo)
      (keymap-set icejam-keys-mode-map (kbd "s-Z") #'undo-redo)
      (keymap-set icejam-keys-mode-map (kbd "s-a") #'mark-whole-buffer)

      ;; Copy and paste bindings
      (keymap-set icejam-keys-mode-map (kbd "s-x") #'kill-region)
      (keymap-set icejam-keys-mode-map (kbd "s-v") #'yank)
      (keymap-set icejam-keys-mode-map (kbd "s-c") #'kill-ring-save)

      ;; Linux Ergo bindings (fix)
      (keymap-set icejam-keys-mode-map (kbd "C-<right>") #'end-of-line)
      (keymap-set icejam-keys-mode-map (kbd "C-<left>") #'beginning-of-line)
      (keymap-set icejam-keys-mode-map (kbd "C-<up>") #'scroll-down) ; WTF is this reverse, I dunno
      (keymap-set icejam-keys-mode-map (kbd "C-<down>") #'scroll-up)))

;; BSD-specific config
(if IS-BSD
    (progn
      (keymap-set icejam-keys-mode-map (kbd "A-<right>") #'end-of-line)
      (keymap-set icejam-keys-mode-map (kbd "A-<left>") #'beginning-of-line)
      (keymap-set icejam-keys-mode-map (kbd "A-<up>") #'scroll-down) ; WTF is this reverse, I dunno
      (keymap-set icejam-keys-mode-map (kbd "A-<down>") #'scroll-up)

      (keymap-set icejam-keys-mode-map (kbd "A-a") #'mark-whole-buffer)
      (keymap-set icejam-keys-mode-map (kbd "A-v") #'yank)
      (keymap-set icejam-keys-mode-map (kbd "A-x") #'kill-region)
      (keymap-set icejam-keys-mode-map (kbd "A-c") #'kill-ring-save)
      (keymap-set icejam-keys-mode-map (kbd "A-s") #'save-buffer)
      (keymap-set icejam-keys-mode-map (kbd "A-l") #'goto-line)
      (keymap-set icejam-keys-mode-map (kbd "A-w") #'icejam-function-delete-window)
      (keymap-set icejam-keys-mode-map (kbd "A-z") #'undo)
      (keymap-set icejam-keys-mode-map (kbd "A-q") #'kill-emacs)))

(provide 'icejam-sys-specific)
;;; icejam-sys-specific.el ends here
