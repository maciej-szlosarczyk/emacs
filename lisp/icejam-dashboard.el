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
  :config
  ;; setopt gives a warning here, so let's use setq
  (setq dashboard-footer-messages '("Happy coding!"
                                   "I showed you my source code, pls respond"))
  (setopt dashboard-startup-banner 'logo)
  (setopt dashboard-items '((recents  . 5)
                            ;; (bookmarks . 5)
                            ;; (agenda . 5)
                            ;; (registers . 5)
                            (projects . 5)))
  (dashboard-setup-startup-hook))

(provide 'icejam-dashboard)
;;; icejam-dashboard.el ends here
