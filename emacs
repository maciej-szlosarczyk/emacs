;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ecf0f1" "#e74c3c" "#2ecc71" "#f1c40f" "#2492db" "#9b59b6" "#1abc9c" "#2c3e50"])
 '(ansi-term-color-vector
   [unspecified "#0b1c2c" "#bf8b56" "#56bf8b" "#8bbf56" "#9b78bc" "#bf568b" "#9b78bc" "#cbd6e2"] t)
 '(background-color "#202020")
 '(background-mode dark)
 '(column-enforce-column 99)
 '(cursor-color "#cccccc")
 '(fci-rule-color "#f1c40f")
 '(foreground-color "#cccccc")
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(package-selected-packages
   (quote
    (dashboard color-theme-approximate smex yaml-mode web-mode ujelly-theme smart-mode-line scala-mode rvm ruby-end rainbow-mode rainbow-delimiters racer noctilux-theme monokai-theme markdown-mode less-css-mode json-reformat jade-mode indent-guide helm-themes helm-projectile helm-ag haskell-mode haml-mode groovy-mode flycheck flatui-theme exec-path-from-shell evil-nerd-commenter evil-magit evil-leader elpy dumb-jump dockerfile-mode diff-hl column-enforce-mode base16-theme avk-emacs-themes atom-one-dark-theme all-the-icons alchemist aggressive-indent ag)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9"))
 '(custom-safe-themes
   (quote
    ("15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" default)))
 '(package-selected-packages
   (quote
    (flatui-theme ##)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Set performance
(setq gc-cons-threshold 100000000)

; load custom config files
(load "~/.emacs.d/init.elc")
;;; emacs ends here
