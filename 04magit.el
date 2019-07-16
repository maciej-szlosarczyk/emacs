;;; Magit
(use-package magit
  :ensure t
  :bind ("<f5> c" . magit-checkout)
        ("<f5> b" . magit-blame)
        ("<f5> g" . magit-status)
        (:map magit-blame-mode-map
              ("<f5> b" . 'magit-blame-quit)))
