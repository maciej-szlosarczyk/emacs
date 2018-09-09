(setq-default ivy-use-virtual-buffers t
              ivy-count-format "(%d of %d) "
              ivy-display-style 'fancy)

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
