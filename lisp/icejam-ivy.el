;;; icejam-ivy -- Counsel, Swiper and Ivy. -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;; Code:

(require 'icejam-keys-mode)

(use-package helpful :straight t :defer t)
(use-package ivy :straight t :defer t
  :config (setq ivy-use-virtual-buffers t ;; Display recent files in ivy-switch-buffer
                ivy-count-format "(%d of %d) " ;; Current candidate count style
                ivy-wrap t ;; Wrap around completions
                ivy-display-style 'fancy) ;; Formatting style
  (ivy-mode 1))

(use-package swiper :straight t)
(use-package counsel :straight t :requires (helpful ivy swiper))

(with-eval-after-load 'counsel
  (define-key icejam-keys-mode-map (kbd "C-c a") 'counsel-rg)
  (define-key icejam-keys-mode-map (kbd "C-c t") 'counsel-find-file)
  (define-key icejam-keys-mode-map (kbd "C-c C-s") 'swiper) ;; Find things by regexp
  (define-key icejam-keys-mode-map (kbd "M-x") 'counsel-M-x) ;; M-x on steroids

  ;; Help bindings
  (define-key icejam-keys-mode-map (kbd "<f1> f") 'counsel-describe-function)
  (define-key icejam-keys-mode-map (kbd "<f1> v") 'counsel-describe-variable)
  (define-key icejam-keys-mode-map (kbd "<f1> b") 'counsel-descbinds)
  (define-key icejam-keys-mode-map (kbd "<f1> x") 'helpful-command)
  (define-key icejam-keys-mode-map (kbd "<f1> l") 'counsel-find-library)
  (define-key icejam-keys-mode-map (kbd "C-h f") 'counsel-describe-function)
  (define-key icejam-keys-mode-map (kbd "C-h v") 'counsel-describe-variable)
  (define-key icejam-keys-mode-map (kbd "C-h b") 'counsel-descbinds)
  (define-key icejam-keys-mode-map (kbd "C-h x") 'helpful-command)
  (define-key icejam-keys-mode-map (kbd "C-h l") 'counsel-find-library)

  (setq counsel-describe-function-function 'helpful-callable)
  (setq counsel-describe-variable-function 'helpful-variable)

  ;; Other stuff
  (define-key icejam-keys-mode-map (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (define-key icejam-keys-mode-map (kbd "<f2> u") 'counsel-unicode-char))



(provide 'icejam-ivy)
;;; icejam-ivy.el ends here
