;;; icejam-themes.el -- Theme configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package spaceline :straight t :defer t)

(use-package base16-theme :straight t :defer t)
(use-package apropospriate-theme :straight t :defer t)
(use-package leuven-theme :straight t :defer t)
(use-package modus-themes :straight t :defer t)
(use-package darktooth-theme :straight t :defer t)
(use-package cyberpunk-theme :straight t :defer t)
(use-package color-theme-sanityinc-tomorrow :straight t :defer t)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Set themes for terminal mode
(setq base16-theme-256-color-source "colors")

;; Light themes
(load-theme 'apropospriate-light t t)
(load-theme 'leuven t t)
(load-theme 'base16-atelier-forest-light t t)
(load-theme 'base16-harmonic16-light t t)
(load-theme 'base16-horizon-light t t)
(load-theme 'base16-humanoid-light t t)
(load-theme 'sanityinc-tomorrow-day t t)

;; Dark themes
(load-theme 'cyberpunk t t)
(load-theme 'darktooth t t)
(load-theme 'base16-zenburn t)
(load-theme 'base16-tomorrow-night-eighties t t)
(load-theme 'base16-darcula t t)
(load-theme 'base16-solarflare t t)
(load-theme 'base16-snazzy t t)
(load-theme 'base16-onedark t t)
(load-theme 'base16-gruvbox-dark-hard t t)
(load-theme 'modus-vivendi t t)
(load-theme 'base16-zenbones t t)
(load-theme 'sanityinc-tomorrow-eighties t t)
(load-theme 'sanityinc-tomorrow-night t t)

;; My own theme modifications:
(require 'icejam-base16-zenburn)
(require 'icejam-base16-harmonic-light)

(spaceline-emacs-theme)
(enable-theme 'base16-zenburn-modified)

(provide 'icejam-themes)
;;; icejam-themes.el ends here
