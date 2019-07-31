;; Use smart-mode-line
(use-package smart-mode-line
  :ensure t
  :config
  (setq-default sml/no-confirm-load-theme t)
  (setq-default display-time-format "%H:%M") ;; time format to display on mode line
  (sml/setup))

(load "$HOME/.emacs.d/themes/themes-base16-not-harmonic.el" 'f 't)
(load-theme 'base16-mexico-light t t)
(load-theme 'manoj-dark t t)
(load-theme 'base16-one-light t t)
(load-theme 'base16-zenburn t t)
(load-theme 'base16-mocha t t)
(load-theme 'planet t t)

(defun base16-mexico-light-custom ()
  "Additional configuration for Base16 theme."
  (set-face-attribute 'mode-line nil :font "Hasklig 15"))

(if (display-graphic-p)
    (progn
      (sml/apply-theme 'respectful)
      (enable-theme 'base16-mocha))
  (progn
    (enable-theme 'planet)))

;; Set font face
;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-font-size (size)
  "Set font SIZE to X px."
  (interactive "NNew font size: ")
  (set-face-attribute 'default nil :font (format "Hasklig %d" size))
  (set-face-attribute 'mode-line nil :font (format "Hasklig %d" size)))

(set-font-size 16)

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))
