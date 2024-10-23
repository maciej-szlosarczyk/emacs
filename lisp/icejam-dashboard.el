;;; dashboard.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Dashboard extracted from Spacemacs.

;;; Code:

(use-package dashboard
  :ensure (:wait t)
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-footer-messages
        '("Happy coding!" "I showed you my source code, pls respond"))

  (setq dashboard-startup-banner 'logo)

  (setq dashboard-items '((recents  . 5)
                          ;; (bookmarks . 5)
                          ;; (agenda . 5)
                          ;; (registers . 5)
                          (projects . 5))))

(provide 'icejam-dashboard)
;;; icejam-dashboard.el ends here
