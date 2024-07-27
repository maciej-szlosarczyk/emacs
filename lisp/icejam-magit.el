;;; icejam-magit.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package magit
  :straight t
  :defer t
  :bind ("<f5> c" . magit-checkout)
        ("<f5> b" . magit-blame-addition)
        ("<f5> g" . magit-status)
        (:map magit-blame-mode-map
              ("<f5> b" . 'magit-blame-quit)))

(provide 'icejam-magit)
;;; icejam-magit.el ends here
