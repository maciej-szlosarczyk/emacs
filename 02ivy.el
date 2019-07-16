(use-package ivy
  :requires (counsel swiper)
  :ensure t
  :config (setq-default ivy-use-virtual-buffers t ;; Display recent files in ivy-switch-buffer
                        ivy-count-format "(%d of %d) " ;; Current candidate count style
                        ivy-display-style 'fancy) ;; Formatting style
  :bind ("C-c a" . counsel-ag)
        ("C-c a" . counsel-ag)
        ("C-c b" . ivy-switch-buffer)
        ("C-c t" . counsel-find-file)

        ("C-c C-s" . swiper) ;; Find things by regexp
        ("M-x" . counsel-M-x) ;; M-x on steroids

        ("<f1> f" . counsel-describe-function)
        ("<f1> v" . counsel-describe-variable)
        ("<f1> l" . counsel-find-library)
        ("<f2> i" . counsel-info-lookup-symbol)
        ("<f2> u" . counsel-unicode-char)
        ("C-c b" . ivy-switch-buffer))
