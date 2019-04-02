;; Use smart-mode-line
(require 'smart-mode-line)

(setq-default sml/no-confirm-load-theme t)
(setq-default display-time-format "%H:%M") ;; time format to display on mode line
(sml/setup)

(load "~/.emacs.d/10themes-base16-not-harmonic.el" t)
(load-theme 'base16-mexico-light t t)
(load-theme 'manoj-dark t t)
(load-theme 'base16-one-light t t)

(defun base16-mexico-light-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "Hasklig 15"))

(if (display-graphic-p)
    (progn
      (sml/apply-theme 'respectful)
      (enable-theme 'base16-not-harmonic))
  (progn
    (enable-theme 'manoj-dark)))

;; Set font face
(set-font-size 16)

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))
