;; Use smart-mode-line
(require 'smart-mode-line)

(setq-default sml/no-confirm-load-theme t)
(setq-default display-time-format "%H:%M") ;; time format to display on mode line

(sml/setup)
(sml/apply-theme 'respectful)

(load "~/.emacs.d/10themes-base16-not-harmonic.el")
(load-theme 'base16-mexico-light t t)
(load-theme 'flatui t t)

(defun base16-mexico-light-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "Hasklig 15")
  (set-face-attribute 'linum nil :font "Hasklig 15"
                      :slant 'normal))

(defun base16-harmonic-custom ()
  "Additional configuration for Base 16 theme."
  (set-face-attribute 'linum nil :font "Hasklig 15"
                      :slant 'normal
                      :background "#2c3a47")

  (set-face-attribute 'font-lock-comment-delimiter-face nil
                      :foreground "#aabcce")
  (set-face-attribute 'mode-line nil :font "Hasklig 15")
  (set-face-attribute 'fringe nil :background "#2c3a47"
                      :slant 'normal))

(if (display-graphic-p)
    (progn
      (enable-theme 'base16-not-harmonic)
      (base16-harmonic-custom))
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
