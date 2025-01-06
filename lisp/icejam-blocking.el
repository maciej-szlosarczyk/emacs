;;; icejam-blocking.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:
;; These packages are foundational dependency and possibly can be blocking.
;;; Code:

(use-package transient :ensure t)
(use-package company :ensure t)

;; Finally, wait for installation of these four packages.
(if (fboundp 'elpaca-wait)
    (elpaca-wait))

(provide 'icejam-blocking)
;;; icejam-blocking.el ends here
