;;; themes.el -- Summary

;;; Commentary:
;;; Code:

;; Use smart-mode-line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'respectful)

;; Display time on mode line
(setq display-time-format "%H:%M")
(display-time-mode t)
()
(load-theme 'flatui t t)
(load "~/.emacs.d/config/base16-not-harmonic-theme.el")
(load-theme 'base16-not-harmonic t t)
(load-theme 'base16-mexico-light t t)
(load-theme 'base16-unikitty-light t t)
(load-theme 'base16-summerfruit-light t t)
(load-theme 'base16-material-darker t t)
(load-theme 'atom-one-dark t t)

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

(defun base16-summerfruit-light-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "Hasklig 15")
  (set-face-attribute 'linum nil :font "Hasklig 15"
                      :slant 'normal))

(defun base16-material-darker-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "Hasklig 15")
  (set-face-attribute 'linum nil :font "Hasklig 15"
                      :slant 'normal))

(require 'helm-themes)
(if (display-graphic-p)
    (progn
      (enable-theme 'base16-material-darker)
      (base16-material-darker-custom))
  (progn
    (color-theme-approximate-on)
    (enable-theme 'flatui)))

;; Set font face
(set-face-attribute 'default nil :font "Hasklig 15")
(set-face-attribute 'helm-selection nil :font "Hasklig 15")
(set-face-attribute 'helm-header nil :font "Hasklig 17")

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default))

(provide 'themes)
;;; themes.el ends here
