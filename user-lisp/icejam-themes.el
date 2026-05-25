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
(use-package modus-themes :ensure t)

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
  (require 'icejam-base16-catppuccin-frappe)

  (if (memq window-system '(x mac ns))
      (enable-theme 'icejam-base16-catppuccin-frappe)
    (enable-theme 'icejam-base16-zenburn)))

(provide 'icejam-themes)
;;; icejam-themes.el ends here
