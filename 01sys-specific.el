;;; 01sys-specific -- summary
;;; Commentary:
;;; Make Emacs play nicer with specific operating systems
;;; Code:

(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-BSD (eq system-type 'berkeley-unix))

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

      ;; Disable meta on right alt (useful for Polish characters)
      (setq mac-right-option-modifier nil)))

;;;;;;;;; BSD-specific config ;;;;;;;;;;;;;;;;;;;;;
(if IS-BSD
    (progn
      (global-set-key (kbd "A-<right>") 'end-of-line)
      (global-set-key (kbd "A-<left>") 'beginning-of-line)
      (global-set-key (kbd "A-<up>") 'scroll-down) ; WTF is this reverse, I dunno
      (global-set-key (kbd "A-<down>") 'scroll-up)

      (global-set-key (kbd "A-a") 'mark-whole-buffer)
      (global-set-key (kbd "A-v") 'yank)
      (global-set-key (kbd "A-x") 'kill-region)
      (global-set-key (kbd "A-c") 'kill-ring-save)
      (global-set-key (kbd "A-s") 'save-buffer)
      (global-set-key (kbd "A-l") 'goto-line)
      (global-set-key (kbd "A-w")
                      (lambda () (interactive) (delete-window)))
      (global-set-key (kbd "A-z") 'undo)
      (global-set-key (kbd "A-q") 'kill-emacs)))

(provide '01sys-specific)
;;; 01sys-specific.el ends here
