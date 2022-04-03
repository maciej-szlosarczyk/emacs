;;; Themes -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Use smart-mode-line
(use-package smart-mode-line
  :straight t
  :config
  (setq-default sml/no-confirm-load-theme t
                display-time-format "%H:%M") ;; time format to display on mode line
  (sml/setup))

(use-package base16-theme :straight t :defer t)
(use-package apropospriate-theme :straight t :defer t)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Set themes for terminal mode
(setq base16-theme-256-color-source "colors")

;; Light themes
(load-theme 'base16-atelier-forest-light t t)
(load-theme 'base16-harmonic-light t t)
(load-theme 'apropospriate-light t t)
(load-theme 'base16-humanoid-light t t)

;; Dark themes
(load-theme 'base16-zenburn t)
(load-theme 'base16-tomorrow-night-eighties t t)
(load-theme 'base16-darcula t t)
(load-theme 'base16-solarflare t t)
(load-theme 'base16-snazzy t t)
(load-theme 'base16-gruvbox-dark-hard t t)

;; My own theme modifications:
(require 'base16-zenburn-modified-theme
         "$HOME/.emacs.d/themes/base16-zenburn-modified.el")

(require 'base16-harmonic-light-modified-theme
         "$HOME/.emacs.d/themes/base16-harmonic-light-modified.el")

(sml/apply-theme 'respectful)
(enable-theme 'base16-zenburn-modified)

(provide '+custom-pkg-themes)
;;; themes.el ends here
