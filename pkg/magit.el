;;; pkg/magit -- summary
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :defer t
  :bind ("<f5> c" . magit-checkout)
        ("<f5> b" . magit-blame-addition)
        ("<f5> g" . magit-status)
        (:map magit-blame-mode-map
              ("<f5> b" . 'magit-blame-quit)))

(provide 'icejam-pkg-magit)
;;; magit.el ends here
