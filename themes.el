;;; themes.el -- Summary

;;; Commentary:

;; (setq airline-helm-colors t)
;; (setq airline-cursor-colors t)
;; (setq airline-eshell-colors t)

;;; Code:

;; Add mode line icons items
;; (mode-icons-mode)

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

(require 'helm-themes)
(if (display-graphic-p)
    (progn
      (enable-theme 'base16-harmonic-dark)
      (set-face-attribute 'linum nil :font "Hasklig 14"
                    :slant 'normal
                    :background "#0b1c2c"))
  (progn
    (enable-theme 'flatui)))

;; (color-theme-approximate-on)

;; Set font face
(set-face-attribute 'default nil :font "Hasklig 13")
(set-face-attribute 'mode-line nil :font "Hasklig 13")
(set-face-attribute 'helm-selection nil :font "Hasklig 13")
(set-face-attribute 'helm-header nil :font "Hasklig 15")

(provide 'themes)
;;; themes.el ends here
