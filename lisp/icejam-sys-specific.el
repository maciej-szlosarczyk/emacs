;;; sys-specific -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Make Emacs play nicer with specific operating systems
;;; Code:

(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-BSD (eq system-type 'berkeley-unix))
(defconst IS-GNU (eq system-type 'gnu/linux))

(require '+custom-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")

(defun +custom-function-delete-window ()
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
      (define-key +custom-keys-mode-map (kbd "H-<right>") 'end-of-line)
      (define-key +custom-keys-mode-map (kbd "H-<left>") 'beginning-of-line)
      (define-key +custom-keys-mode-map (kbd "H-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (define-key +custom-keys-mode-map (kbd "H-<down>") 'scroll-up)

      (define-key +custom-keys-mode-map [(hyper a)] 'mark-whole-buffer)
      (define-key +custom-keys-mode-map [(hyper v)] 'yank)
      (define-key +custom-keys-mode-map [(hyper x)] 'kill-region)
      (define-key +custom-keys-mode-map [(hyper c)] 'kill-ring-save)
      (define-key +custom-keys-mode-map [(hyper s)] 'save-buffer)
      (define-key +custom-keys-mode-map [(hyper l)] 'goto-line)
      (define-key +custom-keys-mode-map [(hyper b)] 'treemacs)
      (define-key +custom-keys-mode-map [(hyper w)] '+custom-function-delete-window)
      (define-key +custom-keys-mode-map [(hyper z)] 'undo)
      (define-key +custom-keys-mode-map [(hyper q)] 'kill-emacs)

      ;; Disable meta on right alt (useful for Polish characters)
      ;; (setq mac-right-option-modifier nil)
      ))

(defun +custom-switch-right-left-alt ()
  "Set keyboard to das keyboard."
  (interactive)
  (if (eq mac-right-option-modifier nil)
      (progn
        (setq mac-right-option-modifier 'meta)
        (setq mac-option-modifier nil))
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-right-option-modifier nil))))

;;;;;;;;; Mac-specific config ;;;;;;;;;;;;;;;;;;;;;
(if IS-GNU
    (progn
      ;;;; Save and undo
      (define-key +custom-keys-mode-map (kbd "s-s") 'save-buffer)
      (define-key +custom-keys-mode-map (kbd "s-z") 'undo)
      (define-key +custom-keys-mode-map (kbd "s-a") 'mark-whole-buffer)

      ;;;;;;;; Copy and paste bindings ;;;;;;;;;;;;;;;;;;
      (define-key +custom-keys-mode-map (kbd "s-x") 'kill-region)
      (define-key +custom-keys-mode-map (kbd "s-v") 'yank)
      (define-key +custom-keys-mode-map (kbd "s-c") 'kill-ring-save)

      ;;;;;;;;; Linux Ergo bindings (fix) ;;;;;;;;;;;;;;;;;;
      (define-key +custom-keys-mode-map (kbd "C-<right>") 'end-of-line)
      (define-key +custom-keys-mode-map (kbd "C-<left>") 'beginning-of-line)
      (define-key +custom-keys-mode-map (kbd "C-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (define-key +custom-keys-mode-map (kbd "C-<down>") 'scroll-up)))

;;;;;;;;; BSD-specific config ;;;;;;;;;;;;;;;;;;;;;
(if IS-BSD
    (progn
      (define-key +custom-keys-mode-map (kbd "A-<right>") 'end-of-line)
      (define-key +custom-keys-mode-map (kbd "A-<left>") 'beginning-of-line)
      (define-key +custom-keys-mode-map (kbd "A-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (define-key +custom-keys-mode-map (kbd "A-<down>") 'scroll-up)

      (define-key +custom-keys-mode-map (kbd "A-a") 'mark-whole-buffer)
      (define-key +custom-keys-mode-map (kbd "A-v") 'yank)
      (define-key +custom-keys-mode-map (kbd "A-x") 'kill-region)
      (define-key +custom-keys-mode-map (kbd "A-c") 'kill-ring-save)
      (define-key +custom-keys-mode-map (kbd "A-s") 'save-buffer)
      (define-key +custom-keys-mode-map (kbd "A-l") 'goto-line)
      (define-key +custom-keys-mode-map (kbd "A-w" '+delete-window)
      (define-key +custom-keys-mode-map (kbd "A-z") 'undo)
      (define-key +custom-keys-mode-map (kbd "A-q") 'kill-emacs))))

(provide 'icejam-sys-specific)
;;; icejam-sys-specific.el ends here
