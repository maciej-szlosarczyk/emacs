;;; themes -- summary
;;; Commentary:
;;; Code:

;; Use smart-mode-line
(use-package smart-mode-line
  :straight t
  :config
  (setq-default sml/no-confirm-load-theme t)
  (setq-default display-time-format "%H:%M") ;; time format to display on mode line
  (sml/setup))

(use-package base16-theme :straight t :defer t)
(use-package flatui-theme :straight t :defer t)
(use-package planet-theme :straight t :defer t)
(use-package apropospriate-theme :straight t :defer t)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Light themes
(load-theme 'base16-atelier-forest-light t t)
(load-theme 'base16-harmonic-light t t)
(load-theme 'apropospriate-light t t)
(load-theme 'base16-tomorrow t t)

;; Dark themes
(load-theme 'base16-solarflare t t)
(load-theme 'base16-snazzy t t)
(load-theme 'base16-gruvbox-dark-hard t t)

(if (display-graphic-p)
    (progn
      (sml/apply-theme 'respectful)
      (enable-theme (nth
                     (random 2)
                     '(base16-tomorrow base16-harmonic-light))))
  (progn
    (defvar base16-theme-256-color-source "base16-shell")
    (enable-theme 'apropospriate-light)))

;; Set font face
;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-font (name size)
  "Set font to NAME and its SIZE to X pixels."
  (interactive "sNew font: \nnEnter size for font %s: ")
  (set-face-attribute 'default nil :font (format "%s %d" name size))
  ;; Set modeline font to be 1 pixel point smaller than the general font
  (set-face-attribute 'mode-line nil :font (format "%s %d" name (- size 1))))

(defun set-font-to-screen ()
  "Automatically set font size to suit the monitor."
  (interactive)
  ;; If display is set to emulate FullHD resultion or less, make the font
  ;; smaller.
  (cond ((eq (x-display-list) nil)) ()
        ((>= 1050 (x-display-pixel-height)) (set-font "IBM Plex Mono" 14))
        ((>= 1080 (x-display-pixel-height)) (set-font "IBM Plex Mono" 13))
        ((>= 1120 (x-display-pixel-height)) (set-font "IBM Plex Mono" 14))
        ((>= 1440 (x-display-pixel-height)) (set-font "IBM Plex Mono" 16))
        ((>= 2160 (x-display-pixel-height)) (set-font "IBM Plex Mono" 20))
        (t (set-font "IBM Plex Mono" 16))))

;; Do it automatically on startup
(set-font-to-screen)

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))

(provide '+custom-themes)
;;; themes.el ends here
