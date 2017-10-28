;;; init.el --- Summary
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/packages.elc")
(load "~/.emacs.d/functions.elc")
(load "~/.emacs.d/behaviour.elc")
(load "~/.emacs.d/themes.elc")
(load "~/.emacs.d/key-bindings.elc")
(load "~/.emacs.d/spelling.elc")
(load "~/.emacs.d/languages.elc")
(load "~/.emacs.d/windows.elc")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (hlinum etags-select nvm tide yaml-mode window-purpose web-mode ujelly-theme toml-mode smart-mode-line scala-mode rvm ruby-end rspec-mode robe rainbow-mode rainbow-delimiters racer pyenv-mode noctilux-theme monokai-theme markdown-mode less-css-mode json-reformat jade-mode indent-guide helm-themes helm-projectile helm-ag haskell-mode haml-mode groovy-mode flymake-ruby flymake-cursor flycheck flatui-theme exec-path-from-shell evil-nerd-commenter evil-magit evil-leader elpy dumb-jump dockerfile-mode diff-hl dash-at-point company-tern company-racer company-jedi column-enforce-mode color-theme-approximate base16-theme atom-one-dark-theme alchemist aggressive-indent ag)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
