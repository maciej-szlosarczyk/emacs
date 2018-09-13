;;; Magit

(require 'magit)

(global-set-key (kbd "<f5> c") 'magit-checkout)
(global-set-key (kbd "<f5> b") 'magit-blame)
(define-key magit-blame-mode-map (kbd "<f5> b") 'magit-blame-quit)
(global-set-key (kbd "<f5> g") 'magit-status)
