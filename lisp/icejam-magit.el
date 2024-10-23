;;; icejam-magit.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-keys-mode)

(use-package magit
  :ensure t
  :defer t
  :bind (:map icejam-keys-mode-map
              ("<f5> c" . magit-checkout)
              ("<f5> b" . magit-blame-addition)
              ("<f5> g" . magit-status))
        (:map magit-blame-mode-map
              ("<f5> b" . 'magit-blame-quit)))

(provide 'icejam-magit)
;;; icejam-magit.el ends here
