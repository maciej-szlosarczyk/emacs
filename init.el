;;; Init.el -- Summary
;;; Commentary:
;;; Code:
;; list the repositories containing them
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; list the packages you want
(setq package-list '(
                     keyfreq ;; Record how often emacs commands are executed
                     exec-path-from-shell ;; Allow to execute path from shell

                     rainbow-delimiters ;; Colorize matching parens
		                 rainbow-mode ;; Make color symbols like #FFF colorfull

				             magit ;; Git interface for Emacs
                     column-enforce-mode ;; Enforce column length of X
                     window-purpose ;; Make sure that windows are of grouped by
                     ;; purpose.

              	     ;;; Helm replacements
		                 ivy
		                 counsel
		                 swiper
                     hydra ;; Create nice text menus without memorizing too much

                     ;;; Code
                     dash-at-point

                     company ;; Code completion framework
                     yasnippet ;; Code snippets framework
                     yasnippet-snippets ;; Actual snippets for various languages
                     flycheck ;; Compilation framework
                     visual-regexp ;; Regexp replacement with preview in
                     ;; current buffer.
                     lsp-mode
                     company-lsp
                     lsp-ui

                     ;; Project management
                     projectile
                     counsel-projectile

                     ;; Themes
                     smart-mode-line
                     base16-theme
                     flatui-theme

                     ;; Ruby
                     enh-ruby-mode ;; Enhanced Ruby mode
                     robe ;; Ruby REPL inside emacs
                     rvm ;; Support rvm usage
                     ruby-end ;; Insert end for methods automatically
                     rspec-mode ;; RSpec yasnippets

                     ;; Elixir
                     alchemist

                     ;; Rust
                     racer
                     rust-mode
                     flycheck-rust

                     ;; Crystal
                     crystal-mode

                     ;; Web
                     web-mode
                     company-web
                     js2-mode
                     tern
                     company-tern

                     ;; Infrastructure files
                     dockerfile-mode
                     terraform-mode
                     ansible
                     nginx-mode

                     ;; Text files
                     yaml-mode
                     markdown-mode
                     gitignore-mode
                     )
      )

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Additional files
(load "~/.emacs.d/01mac.el")
(load "~/.emacs.d/02ivy.el")
(load "~/.emacs.d/03hydra.el")
(load "~/.emacs.d/04magit.el")
(load "~/.emacs.d/05prog-mode.el")
(load "~/.emacs.d/06company-yasnippet.el")
(load "~/.emacs.d/07projectile.el")
(load "~/.emacs.d/08purpose.el")
(load "~/.emacs.d/09ispell.el")
(load "~/.emacs.d/10themes.el")

;; Actual supported languages
(load "~/.emacs.d/20elisp.el")
(load "~/.emacs.d/20ruby.el")
(load "~/.emacs.d/20web.el")
(load "~/.emacs.d/20elixir.el")
(load "~/.emacs.d/20sh.el")
(load "~/.emacs.d/20rust.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "1f38fb71e55e5ec5f14a39d03ca7d7a416123d3f0847745c7bade053ca58f043" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" default)))
 '(package-selected-packages
   (quote
    (rspec-mode crystal-mode dap-mode lsp-ui company-lsp lsp-mode nginx-mode gitignore-mode js2-mode keyfreq company-web visual-regexp enh-ruby-mode counsel-projectile counsel ivy flycheck-rust flycheck racer rust-mode hydra markdown-mode solarized-theme company-ansible alchemist window-purpose column-enforce-mode yaml-mode ansible dockerfile-mode ruby-end web-mode rvm dash-at-point robe base16-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
