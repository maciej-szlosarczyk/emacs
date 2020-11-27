;;; themes -- summary
;;; Commentary:
;;; Code:

;; Use smart-mode-line
(use-package smart-mode-line
  :ensure t
  :config
  (setq-default sml/no-confirm-load-theme t)
  (setq-default display-time-format "%H:%M") ;; time format to display on mode line
  (sml/setup))

(use-package base16-theme :ensure t)
(use-package flatui-theme :ensure t :defer t)
(use-package planet-theme :ensure t :defer t)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Light themes
(load-theme 'base16-atelier-forest-light t t)
(load-theme 'base16-harmonic-light t t)

;; Dark themes
(load-theme 'base16-solarflare t t)
(load-theme 'base16-snazzy t t)

(if (display-graphic-p)
    (progn
      (sml/apply-theme 'respectful)
      (enable-theme (nth
                     (random 2)
                     '(base16-snazzy base16-solarflare))))
  (progn
    (defvar base16-theme-256-color-source "base16-shell")
    (enable-theme 'base16-atelier-forest-light)))

;; Set font face
;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-font (name size)
  "Set font to NAME and its SIZE to X pixels."
  (interactive "sNew font: \nnEnter size for font %s: ")
  (set-face-attribute 'default nil :font (format "%s %d" name size))
  (set-face-attribute 'mode-line nil :font (format "%s %d" name size)))

(defun set-font-to-screen ()
  "Automatically set font size to suit the monitor."
  (interactive)
  (if (>= 1080 (x-display-pixel-height))
      (set-font "Hack" 13)
    (set-font "Hack" 16)))

;; Do it automatically on startup
(set-font-to-screen)

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))

(provide 'themes/themes)
;;; themes.el ends here
