;;; melpa.el -- summary
;;; Commentary:
;;; Put all the packages you want to install here.
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; Behaviour
(unless (package-installed-p 'helm)
  (package-refresh-contents)
  (package-install 'helm))

(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(unless (package-installed-p 'evil-leader)
  (package-refresh-contents)
  (package-install 'evil-leader))

(unless (package-installed-p 'evil-nerd-commenter)
  (package-refresh-contents)
  (package-install 'evil-nerd-commenter))

;; Rainbow delimiters
(unless (package-installed-p 'rainbow-delimiters)
  (package-refresh-contents)
  (package-install 'rainbow-delimiters))

;; Neotree
(unless (package-installed-p 'neotree)
  (package-refresh-contents)
  (package-install 'neotree))

;; Powerline with mode-line icons
(unless (package-installed-p 'smart-mode-line)
  (package-refresh-contents)
  (package-install 'smart-mode-line))

(unless (package-installed-p 'indent-guide)
  (package-refresh-contents)
  (package-install 'indent-guide))

(unless (package-installed-p 'projectile)
  (package-refresh-contents)
  (package-install 'projectile))

(unless (package-installed-p 'ag)
  (package-refresh-contents)
  (package-install 'ag))

(unless (package-installed-p 'helm-projectile)
  (package-refresh-contents)
  (package-install 'helm-projectile))

(unless (package-installed-p 'helm-ag)
  (package-refresh-contents)
  (package-install 'helm-ag))

(unless (package-installed-p 'aggressive-indent)
  (package-refresh-contents)
  (package-install 'aggressive-indent))

(unless (package-installed-p 'dumb-jump)
  (package-refresh-contents)
  (package-install 'dumb-jump))

; Run stuff directly from shell
(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell))

; Themes
(unless (package-installed-p 'base16-theme)
  (package-refresh-contents)
  (package-install 'base16-theme))

(unless (package-installed-p 'noctilux-theme)
  (package-refresh-contents)
  (package-install 'noctilux-theme))

(unless (package-installed-p 'ujelly-theme)
  (package-refresh-contents)
  (package-install 'ujelly-theme))

(unless (package-installed-p 'avk-emacs-themes)
  (package-refresh-contents)
  (package-install 'avk-emacs-themes))

(unless (package-installed-p 'flatui-theme)
  (package-refresh-contents)
  (package-install 'flatui-theme))

(unless (package-installed-p 'all-the-icons)
  (package-refresh-contents)
  (package-install 'all-the-icons))

(unless (package-installed-p 'atom-one-dark-theme)
  (package-refresh-contents)
  (package-install 'atom-one-dark-theme))

; Elixir
(unless (package-installed-p 'elixir-mode)
  (package-refresh-contents)
  (package-install 'elixir-mode))

(unless (package-installed-p 'alchemist)
  (package-refresh-contents)
  (package-install 'alchemist))

; Ruby
(unless (package-installed-p 'rvm)
  (package-refresh-contents)
  (package-install 'rvm))

(unless (package-installed-p 'ruby-end)
  (package-refresh-contents)
  (package-install 'ruby-end))

(unless (package-installed-p 'haml-mode)
  (package-refresh-contents)
  (package-install 'haml-mode))

(unless (package-installed-p 'yaml-mode)
  (package-refresh-contents)
  (package-install 'yaml-mode))

; Git
(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))

(unless (package-installed-p 'diff-hl)
  (package-refresh-contents)
  (package-install 'diff-hl))

(unless (package-installed-p 'evil-magit)
  (package-refresh-contents)
  (package-install 'evil-magit))

; Code quality and helpers
(unless (package-installed-p 'flycheck)
  (package-refresh-contents)
  (package-install 'flycheck))

(unless (package-installed-p 'projectile)
  (package-refresh-contents)
  (package-install 'projectile))

(unless (package-installed-p 'yasnippet)
  (package-refresh-contents)
  (package-install 'yasnippet))

; Markdown helper
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode))

(unless (package-installed-p 'dockerfile-mode)
  (package-refresh-contents)
  (package-install 'dockerfile-mode))

; Scala, Haskell, Rust
(unless (package-installed-p 'haskell-mode)
  (package-refresh-contents)
  (package-install 'haskell-mode))

(unless (package-installed-p 'scala-mode)
  (package-refresh-contents)
  (package-install 'scala-mode))

(unless (package-installed-p 'rust-mode)
  (package-refresh-contents)
  (package-install 'rust-mode))
;;; elpa.el ends here
