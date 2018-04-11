;;; melpa.el -- summary
;;; Commentary:
;;; Put all the packages you want to install here.
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(if (display-graphic-p) ; Run this only if there's GUI
    (progn
      (package-refresh-contents))) ; Refresh only once, on startup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behaviour

(unless (package-installed-p 'helm)
  (package-install 'helm))

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))

(unless (package-installed-p 'evil-nerd-commenter)
  (package-install 'evil-nerd-commenter))

;; Ctags
(unless (package-installed-p 'etags-select)
  (package-install 'etags-select))

;; Rainbow delimiters
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

;; Smart mode line
(unless (package-installed-p 'smart-mode-line)
  (package-install 'smart-mode-line))

;; Show hex colors in UI
(unless (package-installed-p 'rainbow-mode)
  (package-install 'rainbow-mode))

;; Indentation and line length
(unless (package-installed-p 'indent-guide)
  (package-install 'indent-guide))

(unless (package-installed-p 'column-enforce-mode)
  (package-install 'column-enforce-mode))

(unless (package-installed-p 'aggressive-indent)
  (package-install 'aggressive-indent))

;; Window management
(unless (package-installed-p 'window-purpose)
  (package-install 'window-purpose))

;; Dash integration
(unless (package-installed-p 'dash-at-point)
  (package-install 'dash-at-point))

;; Project management
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(unless (package-installed-p 'ag)
  (package-install 'ag))

(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))

(unless (package-installed-p 'helm-ag)
  (package-install 'helm-ag))


(unless (package-installed-p 'dumb-jump)
  (package-install 'dumb-jump))

; Run stuff directly from shell
(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))

;; Git
(unless (package-installed-p 'magit)
  (package-install 'magit))

(unless (package-installed-p 'diff-hl)
  (package-install 'diff-hl))

(unless (package-installed-p 'evil-magit)
  (package-install 'evil-magit))

;; Code quality and helpers
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))

(unless (package-installed-p 'flymake)
  (package-install 'flymake))

(unless (package-installed-p 'flymake-cursor)
  (package-install 'flymake-cursor))

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes
(unless (package-installed-p 'color-theme-approximate)
  (package-install 'color-theme-approximate))

(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))

(unless (package-installed-p 'noctilux-theme)
  (package-install 'noctilux-theme))

(unless (package-installed-p 'ujelly-theme)
  (package-install 'ujelly-theme))

(unless (package-installed-p 'flatui-theme)
  (package-install 'flatui-theme))

(unless (package-installed-p 'atom-one-dark-theme)
  (package-install 'atom-one-dark-theme))

(unless (package-installed-p 'helm-themes)
  (package-install 'helm-themes))

(unless (package-installed-p 'base16-theme)
  (package-install 'base16-theme))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Languages and frameworks

;; Elixir
(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))

; Ruby
(unless (package-installed-p 'rvm)
  (package-install 'rvm))

(unless (package-installed-p 'ruby-end)
  (package-install 'ruby-end))

(unless (package-installed-p 'haml-mode)
  (package-install 'haml-mode))

(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))

(unless (package-installed-p 'jade-mode)
  (package-install 'jade-mode))

(unless (package-installed-p 'less-css-mode)
  (package-install 'less-css-mode))

(unless (package-installed-p 'robe)
  (package-install 'robe))

(unless (package-installed-p 'rspec-mode)
  (package-install 'rspec-mode))

(unless (package-installed-p 'minitest)
  (package-install 'minitest))

(unless (package-installed-p 'flymake-ruby)
  (package-install 'flymake-ruby))

; Web mode for editing erb
(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))

; JSON prettifier
(unless (package-installed-p 'json-reformat)
  (package-install 'json-reformat))

; Markdown helper
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;; Docker
(unless (package-installed-p 'dockerfile-mode)
  (package-install 'dockerfile-mode))

;; Jenkinsfile
(unless (package-installed-p 'groovy-mode)
  (package-install 'groovy-mode))

;; Apache
(unless (package-installed-p 'apache-mode)
  (package-install 'apache-mode))

;; Haskell
(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

(unless (package-installed-p 'company-ghc)
  (package-install 'company-ghc))

;; Scala
(unless (package-installed-p 'scala-mode)
  (package-install 'scala-mode))

;; Rust
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))

(unless (package-installed-p 'racer)
  (package-install 'racer))

(unless (package-installed-p 'company-racer)
  (package-install 'company-racer))

(unless (package-installed-p 'toml-mode)
  (package-install 'toml-mode))

(unless (package-installed-p 'flycheck-rust)
  (package-install 'flycheck-rust))

;; Python
(unless (package-installed-p 'elpy)
  (package-install 'elpy))

(unless (package-installed-p 'company-jedi)
  (package-install 'company-jedi))

(unless (package-installed-p 'pyenv-mode)
  (package-install 'pyenv-mode))

;; Go
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

(unless (package-installed-p 'company-go)
  (package-install 'company-go))

(unless (package-installed-p 'flymake-go)
  (package-install 'flymake-go))

;; SQL
(unless (package-installed-p 'sql-indent)
  (package-install 'sql-indent))

;; Javascript
(unless (package-installed-p 'company-tern)
  (package-install 'company-tern))

(unless (package-installed-p 'tide)
  (package-install 'tide))

(unless (package-installed-p 'nvm)
  (package-install 'nvm))
;;; packages.el ends here
