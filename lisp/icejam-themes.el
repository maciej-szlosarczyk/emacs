;;; icejam-themes.el -- Theme configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package spaceline :ensure t :defer t)

(use-package base16-theme :ensure t
  :init
  (load-theme 'base16-atelier-forest-light t t)
  (load-theme 'base16-harmonic16-light t t)
  (load-theme 'base16-horizon-light t t)
  (load-theme 'base16-humanoid-light t t)
  (load-theme 'base16-zenburn t)
  (load-theme 'base16-tomorrow-night-eighties t t)
  (load-theme 'base16-darcula t t)
  (load-theme 'base16-solarflare t t)
  (load-theme 'base16-snazzy t t)
  (load-theme 'base16-onedark t t)
  (load-theme 'base16-gruvbox-dark-hard t t)
  (load-theme 'modus-vivendi t t)
  (load-theme 'base16-zenbones t t)
  :config
  ;; Set themes for terminal mode
  (setq base16-theme-256-color-source "colors"))

(use-package apropospriate-theme :ensure t
  :init (load-theme 'apropospriate-light t t))
(use-package leuven-theme :ensure t
  :init
  (load-theme 'leuven t t))
(use-package modus-themes :ensure t)
(use-package darktooth-theme :ensure t
  :init
  (load-theme 'darktooth t t))

(use-package cyberpunk-theme :ensure t
  :init
  (load-theme 'cyberpunk t t))

(use-package color-theme-sanityinc-tomorrow :ensure t
  :init
  ;; Dark themes
  (load-theme 'sanityinc-tomorrow-eighties t t)
  (load-theme 'sanityinc-tomorrow-night t t)
  ;; Light theme
  (load-theme 'sanityinc-tomorrow-day t t))

(use-package zenburn-theme :ensure t
  :init
  (load-theme 'zenburn t t))
(use-package catppuccin-theme :ensure t
  :init (load-theme 'catppuccin t t)
  :config (setq catppuccin-flavor 'frappe))


;; Disable cursor blinking
(blink-cursor-mode 0)

;; My own theme modifications:
(with-eval-after-load 'base16-theme
  (setq base16-theme-256-color-source "colors")
  (require 'icejam-base16-zenburn)
  (require 'icejam-base16-harmonic-light)
  (enable-theme 'icejam-base16-zenburn))

;; This is spacemacs modeline but I have disabled it for now.
;; It doesn't seem like I need it for anything.
;; (spaceline-emacs-theme)
(declare-function spaceline-emacs-theme nil)

(provide 'icejam-themes)
;;; icejam-themes.el ends here
