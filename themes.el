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

(load-theme 'flatui t t)
(load "~/.emacs.d/base16-not-harmonic-theme.el")
(load-theme 'base16-not-harmonic t t)

(defun base16-harmonic-custom ()
  "Additional configuration for Base 16 theme."
  (set-face-attribute 'linum nil :font "Hasklig 14"
                      :slant 'normal
                      :background "#2c3a47")

  (set-face-attribute 'font-lock-comment-delimiter-face nil
                      :foreground "#aabcce")
  (set-face-attribute 'mode-line nil :font "Hasklig 13")
  (set-face-attribute 'fringe nil :background "#2c3a47"
                      :slant 'normal))

(require 'helm-themes)
(if (display-graphic-p)
    (progn
      (enable-theme 'base16-not-harmonic)
      (base16-harmonic-custom))
  (progn
    (enable-theme 'flatui)))

;; (color-theme-approximate-on)

;; Set font face
(set-face-attribute 'default nil :font "Hasklig 13")
(set-face-attribute 'helm-selection nil :font "Hasklig 13")
(set-face-attribute 'helm-header nil :font "Hasklig 15")

(provide 'themes)
;;; themes.el ends here
