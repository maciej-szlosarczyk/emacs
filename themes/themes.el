;; Use smart-mode-line
(use-package smart-mode-line
  :ensure t
  :config
  (setq-default sml/no-confirm-load-theme t)
  (setq-default display-time-format "%H:%M") ;; time format to display on mode line
  (sml/setup))

;; Disable cursor blinking
(blink-cursor-mode 0)

(load "$HOME/.emacs.d/themes/themes-base16-not-harmonic.el" 'f 't)
(load "$HOME/.emacs.d/themes/themes-base16-zenburn-modified.el" 'f 't)
(load-theme 'base16-mexico-light t t)
(load-theme 'base16-ia-dark t t)
(load-theme 'manoj-dark t t)
(load-theme 'base16-one-light t t)
(load-theme 'base16-zenburn t t)
(load-theme 'base16-atelier-forest-light t t)
(load-theme 'base16-material-palenight t t)
(load-theme 'base16-mocha t t)
(load-theme 'planet t t)

(defun base16-mexico-light-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "IBM Plex Mono 15"))

(if (display-graphic-p)
    (progn
      (sml/apply-theme 'respectful)
      (enable-theme 'base16-material-palenight))
  (progn
    (enable-theme 'base16-mexico-light)
		(setq base16-theme-256-color-source "base16-shell")))

;; Set font face
;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-font-size (size)
  "Set font SIZE to X px."
  (interactive "NNew font size: ")
  (set-face-attribute 'default nil :font (format "IBM Plex Mono %d" size))
  (set-face-attribute 'mode-line nil :font (format "IBM Plex Mono %d" size)))

(set-font-size 16)

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))
