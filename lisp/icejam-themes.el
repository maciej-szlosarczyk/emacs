;;; icejam-themes.el -- Theme configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package spaceline :ensure t
  :hook ((elpaca-after-init . spaceline-emacs-theme))
  :config
  ;; Recompile spaceline after each theme has been reloaded to ensure
  ;; that there are no artifacts instead of arrows on the screen.
  (setopt enable-theme-functions 'spaceline-compile))

(use-package base16-theme :ensure t)

;; (use-package apropospriate-theme :ensure t
;;   :config (load-theme 'apropospriate-light t t))
;; (use-package leuven-theme :ensure t
;;   :config
;;   (load-theme 'leuven t t))
(use-package modus-themes :ensure t)
;; (use-package darktooth-theme :ensure t
;;   :config
;;   (load-theme 'darktooth t t))

;; (use-package color-theme-sanityinc-tomorrow :ensure t
;;   :config
;;   ;; Dark themes
;;   (load-theme 'sanityinc-tomorrow-eighties t t)
;;   (load-theme 'sanityinc-tomorrow-night t t)
;;   ;; Light theme
;;   (load-theme 'sanityinc-tomorrow-day t t))

;; (use-package zenburn-theme :ensure t
;;   :config
;;   (load-theme 'zenburn t t))

;; (use-package catppuccin-theme :ensure t
;;   :custom
;;   ((catpuccin-flavor 'frappe))
;;   :config
;;   (load-theme 'catppuccin t t))

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Scroll with the trackpad smoothly
(pixel-scroll-precision-mode 1)

;; My own theme modifications:
(with-eval-after-load 'base16-theme
  (setopt base16-theme-256-color-source 'colors)
  (load-theme 'base16-equilibrium-light t t)
  (load-theme 'base16-gruvbox-dark-pale t t)
  (load-theme 'base16-onedark t t)
  (load-theme 'modus-operandi-tinted t t)
  (require 'icejam-base16-zenburn)
  (require 'icejam-base16-harmonic-light)
  (require 'icejam-base16-catppuccin-latte)

  (if (memq window-system '(x mac ns))
      (enable-theme 'icejam-base16-zenburn)
    (enable-theme 'icejam-base16-zenburn)))

(provide 'icejam-themes)
;;; icejam-themes.el ends here
