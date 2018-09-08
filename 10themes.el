;; Use smart-mode-line
(require 'smart-mode-line)

(setq-default sml/no-confirm-load-theme t)
(setq-default display-time-format "%H:%M") ;; time format to display on mode line

(sml/setup)
(sml/apply-theme 'respectful)

(load-theme 'base16-mexico-light t t)
(load-theme 'flatui t t)

(defun base16-mexico-light-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "Hasklig 15")
  (set-face-attribute 'linum nil :font "Hasklig 15"
                      :slant 'normal))

(if (display-graphic-p)
    (progn
      (enable-theme 'base16-mexico-light)
      (base16-mexico-light-custom))
  (progn
    (enable-theme 'flatui)))

;; Set font face
(set-face-attribute 'default nil :font "Hasklig 15")

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
:background (face-background 'default))
