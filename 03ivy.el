(setq-default ivy-use-virtual-buffers t)
(setq-default ivy-count-format "(%d of %d) ")

(counsel-mode 1)

(evil-leader/set-key "ag" 'counsel-ag)
(evil-leader/set-key "b"  'ivy-switch-buffer)
(evil-leader/set-key "/" 'swiper)
(evil-leader/set-key "t" 'counsel-find-file)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
