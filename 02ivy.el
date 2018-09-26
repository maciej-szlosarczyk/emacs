(setq-default ivy-use-virtual-buffers t ;; Display recent files in ivy-switch-buffer
              ivy-count-format "(%d of %d) " ;; Current candidate count style
              ivy-display-style 'fancy ;; Formatting style
              )

(global-set-key (kbd "C-c a") 'counsel-ag)
(global-set-key (kbd "C-c b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c t") 'counsel-find-file)

(global-set-key (kbd "C-s") 'swiper) ;; Find things by regexp
(global-set-key (kbd "M-x") 'counsel-M-x) ;; M-x on steroids

(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
