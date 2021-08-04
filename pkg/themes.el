;;; themes -- summary
;;; Commentary:
;;; Code:

;; Use smart-mode-line
(use-package smart-mode-line
  :straight t
  :config
  (setq-default sml/no-confirm-load-theme t)
  (setq-default display-time-format "%H:%M") ;; time format to display on mode line
  (sml/setup))

(use-package base16-theme :straight t :defer t)
(use-package flatui-theme :straight t :defer t)
(use-package planet-theme :straight t :defer t)
(use-package apropospriate-theme :straight t :defer t)
(use-package material-theme :straight t :defer t)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Light themes
(load-theme 'material-light t)
(load-theme 'base16-zenburn t)
(load-theme 'base16-atelier-forest-light t t)
(load-theme 'base16-harmonic-light t t)
(load-theme 'apropospriate-light t t)
(load-theme 'base16-humanoid-light t t)

;; Dark themes
(load-theme 'material t)
(load-theme 'base16-solarflare t t)
(load-theme 'base16-snazzy t t)
(load-theme 'base16-gruvbox-dark-hard t t)

(if (display-graphic-p)
    (progn
      (sml/apply-theme 'respectful)
      (enable-theme 'base16-harmonic-light))
  (progn
    (defvar base16-theme-256-color-source "base16-shell")
    (enable-theme 'apropospriate-light)))

(provide '+custom-pkg-themes)
;;; themes.el ends here
