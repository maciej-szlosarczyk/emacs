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

;; (load-theme 'ujelly t t)
;; (load-theme 'avk-daylight t t)
;; (load-theme 'monokai t t)
;; (load-theme 'flatui t t)
;; (load-theme 'atom-one-dark t t)
(load-theme 'flatui t t)
;; (load-theme 'noctilux t t)
;; (load-theme 'whiteboard t t)
;; (load-theme 'dichromacy t t)
(load-theme 'base16-harmonic-dark t t)

(defun base16-harmonic-custom ()
  "Additional configuration for Base 16 theme."
  (set-face-attribute 'linum nil :font "Hasklig 14"
                      :slant 'normal
                      :background "#0b1c2c")
  (set-face-attribute 'mode-line nil :font "Hasklig 13"
                      :background "#2c3a47")
  (set-face-attribute 'fringe nil :background "#2c3a47"))

(require 'helm-themes)
(if (display-graphic-p)
    (progn
      (enable-theme 'base16-harmonic-dark)
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
