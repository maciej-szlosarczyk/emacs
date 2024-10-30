;;; dashboard.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Dashboard extracted from Spacemacs.

;;; Code:

(use-package dashboard :ensure t :demand t
  :commands dashboard-setup-startup-hook
  :hook
  ((elpaca-after-init . dashboard-open))
  :custom
  ((dashboard-footer-messages '("Happy coding!" "I showed you my source code, pls respond"))
   (dashboard-startup-banner 'logo)
   (dashboard-items '((recents  . 5)
                      ;; (bookmarks . 5)
                      ;; (agenda . 5)
                      ;; (registers . 5)
                      (projects . 5))))
  :config (dashboard-setup-startup-hook))

(provide 'icejam-dashboard)
;;; icejam-dashboard.el ends here
