(setq-default ivy-use-virtual-buffers t)
(setq-default ivy-count-format "(%d of %d) ")

(counsel-mode 1)

(evil-leader/set-key "ag" 'counsel-ag)
(evil-leader/set-key "b"  'ivy-switch-buffer)
(evil-leader/set-key "/" 'swiper)
(evil-leader/set-key "t" 'counsel-find-file)
