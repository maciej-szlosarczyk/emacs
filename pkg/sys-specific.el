;;; sys-specific -- summary
;;; Commentary:
;;; Make Emacs play nicer with specific operating systems
;;; Code:

(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-BSD (eq system-type 'berkeley-unix))
(defconst IS-GNU (eq system-type 'gnu/linux))

(require 'icejam-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")

(defun icejam-delete-window ()
  "Kill a window."
  (interactive) (delete-window))

;;;;;;;;; Mac-specific config ;;;;;;;;;;;;;;;;;;;;;
(if IS-MAC
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'hyper)

      (defun mac-switch-meta nil
        "Switch meta between Option and Command."
        (interactive)
        (if (eq mac-option-modifier nil)
            (progn
              (setq mac-option-modifier 'meta)
              (setq mac-command-modifier 'hyper))
          (progn
            (setq mac-option-modifier nil)
            (setq mac-command-modifier 'meta))))

      ;;;;;;;;; Mac binding (fix) ;;;;;;;;;;;;;;;;;;
      (define-key icejam-keys-mode-map (kbd "H-<right>") 'end-of-line)
      (define-key icejam-keys-mode-map (kbd "H-<left>") 'beginning-of-line)
      (define-key icejam-keys-mode-map (kbd "H-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (define-key icejam-keys-mode-map (kbd "H-<down>") 'scroll-up)

      (define-key icejam-keys-mode-map [(hyper a)] 'mark-whole-buffer)
      (define-key icejam-keys-mode-map [(hyper v)] 'yank)
      (define-key icejam-keys-mode-map [(hyper x)] 'kill-region)
      (define-key icejam-keys-mode-map [(hyper c)] 'kill-ring-save)
      (define-key icejam-keys-mode-map [(hyper s)] 'save-buffer)
      (define-key icejam-keys-mode-map [(hyper l)] 'goto-line)
      (define-key icejam-keys-mode-map [(hyper w)] 'icejam-delete-window)
      (define-key icejam-keys-mode-map [(hyper z)] 'undo)
      (define-key icejam-keys-mode-map [(hyper q)] 'kill-emacs)

      ;; Disable meta on right alt (useful for Polish characters)
      (setq mac-right-option-modifier nil)))

;;;;;;;;; Mac-specific config ;;;;;;;;;;;;;;;;;;;;;
(if IS-GNU
    (progn
      ;;;;;;;;; Linux Ergo bindings (fix) ;;;;;;;;;;;;;;;;;;
      (define-key icejam-keys-mode-map (kbd "C-<right>") 'end-of-line)
      (define-key icejam-keys-mode-map (kbd "C-<left>") 'beginning-of-line)
      (define-key icejam-keys-mode-map (kbd "C-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (define-key icejam-keys-mode-map (kbd "C-<down>") 'scroll-up)))

;;;;;;;;; BSD-specific config ;;;;;;;;;;;;;;;;;;;;;
(if IS-BSD
    (progn
      (define-key icejam-keys-mode-map (kbd "A-<right>") 'end-of-line)
      (define-key icejam-keys-mode-map (kbd "A-<left>") 'beginning-of-line)
      (define-key icejam-keys-mode-map (kbd "A-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (define-key icejam-keys-mode-map (kbd "A-<down>") 'scroll-up)

      (define-key icejam-keys-mode-map (kbd "A-a") 'mark-whole-buffer)
      (define-key icejam-keys-mode-map (kbd "A-v") 'yank)
      (define-key icejam-keys-mode-map (kbd "A-x") 'kill-region)
      (define-key icejam-keys-mode-map (kbd "A-c") 'kill-ring-save)
      (define-key icejam-keys-mode-map (kbd "A-s") 'save-buffer)
      (define-key icejam-keys-mode-map (kbd "A-l") 'goto-line)
      (define-key icejam-keys-mode-map (kbd "A-w" 'icejam-delete-window)
      (define-key icejam-keys-mode-map (kbd "A-z") 'undo)
      (define-key icejam-keys-mode-map (kbd "A-q") 'kill-emacs))))

(provide 'icejam-pkg-sys-specific)
;;; sys-specific.el ends here
