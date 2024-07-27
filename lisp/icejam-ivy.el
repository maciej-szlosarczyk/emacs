;;; pkg/ivy -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Counsel, Swiper and Ivy.
;;; Code:

(require '+custom-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")


(use-package helpful :straight t :defer t)
(use-package counsel :straight t :defer t :requires (helpful)
  :config
  ;; Use helpful for showing Elisp documentation
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable))

(use-package swiper :straight t :defer t)

(use-package ivy
  :requires (counsel swiper helpful)
  :straight t
  :defer t
  :config (setq ivy-use-virtual-buffers t ;; Display recent files in ivy-switch-buffer
                ivy-count-format "(%d of %d) " ;; Current candidate count style
                ivy-wrap t ;; Wrap around completions
                ivy-display-style 'fancy ;; Formatting style
                ))

(define-key +custom-keys-mode-map (kbd "C-c a") 'counsel-rg)
(define-key +custom-keys-mode-map (kbd "C-c t") 'counsel-find-file)
(define-key +custom-keys-mode-map (kbd "C-c C-s") 'swiper) ;; Find things by regexp
(define-key +custom-keys-mode-map (kbd "M-x") 'counsel-M-x) ;; M-x on steroids

 ;; List all key bindings there are.
(define-key +custom-keys-mode-map (kbd "<f1> f") 'counsel-describe-function)
(define-key +custom-keys-mode-map (kbd "<f1> v") 'counsel-describe-variable)
(define-key +custom-keys-mode-map (kbd "<f1> l") 'counsel-find-library)
(define-key +custom-keys-mode-map (kbd "<f2> i") 'counsel-info-lookup-symbol)
(define-key +custom-keys-mode-map (kbd "<f2> u") 'counsel-unicode-char)

(provide 'icejam-ivy)
;;; icejam-ivy.el ends here
