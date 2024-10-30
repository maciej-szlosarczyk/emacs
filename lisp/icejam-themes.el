;;; icejam-themes.el -- Theme configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package spaceline :ensure t
  :hook ((elpaca-after-init . spaceline-emacs-theme)))

(use-package base16-theme :ensure t
  ;; :config
  ;; (load-theme 'base16-atelier-forest-light t t)
  ;; (load-theme 'base16-harmonic16-light t t)
  ;; (load-theme 'base16-horizon-light t t)
  ;; (load-theme 'base16-humanoid-light t t)
  ;; (load-theme 'base16-zenburn t)
  ;; (load-theme 'base16-tomorrow-night-eighties t t)
  ;; (load-theme 'base16-darcula t t)
  ;; (load-theme 'base16-solarflare t t)
  ;; (load-theme 'base16-snazzy t t)
  ;; (load-theme 'base16-onedark t t)
  ;; (load-theme 'base16-gruvbox-dark-hard t t)
  ;; (load-theme 'modus-vivendi t t)
  ;; (load-theme 'base16-zenbones t t)
  )

;; (use-package apropospriate-theme :ensure t
;;   :config (load-theme 'apropospriate-light t t))
;; (use-package leuven-theme :ensure t
;;   :config
;;   (load-theme 'leuven t t))
;; (use-package modus-themes :ensure t )
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

;; My own theme modifications:
(with-eval-after-load 'base16-theme
  (setq base16-theme-256-color-source "colors")
  (require 'icejam-base16-zenburn)
  (require 'icejam-base16-harmonic-light)

  (if (memq window-system '(x mac ns))
      (enable-theme 'icejam-base16-zenburn)
    (enable-theme 'icejam-base16-zenburn)))

(provide 'icejam-themes)
;;; icejam-themes.el ends here
