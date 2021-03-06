;;; dashboard.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Dashboard extracted from Spacemacs.

;;; Code:

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-startup-banner 'logo)

(setq dashboard-items '((recents  . 5)
                        ;; (bookmarks . 5)
                        ;; (agenda . 5)
                        ;; (registers . 5)
                        (projects . 5)))

(provide 'icejam-pkg-dashboard)
;;; dashboard.el ends here
