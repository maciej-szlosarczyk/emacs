;; (setq airline-helm-colors t)
;; (setq airline-cursor-colors t)
;; (setq airline-eshell-colors t)

;; Neotree theme
(setq neo-theme 'arrow)

;; Add mode line icons items
;; (mode-icons-mode)

;; Use smart-mode-line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'dark)

;; Display time on mode line
(setq display-time-format "%H:%M")
(display-time-mode t)

;; (load-theme 'ujelly t t)
(load-theme 'avk-daylight t t)
(load-theme 'monokai t t)
;; (load-theme 'flatui t t)
(load-theme 'atom-one-dark t t)
(load-theme 'flatui t t)
(load-theme 'noctilux t t)
(load-theme 'whiteboard t t)

(require 'helm-themes)
(if (display-graphic-p)
    (progn
      (enable-theme 'flatui))
  (progn
    (enable-theme 'flatui)))

(color-theme-approximate-on)
(set-face-attribute 'default nil :font "Hasklig 13")
(set-face-attribute 'mode-line nil :font "Hasklig 12")
(set-face-attribute 'linum nil :font "Hasklig 13")
