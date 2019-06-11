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

                     ;; Language server protocol
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
                     planet-theme

                     ;; Ruby
                     enh-ruby-mode ;; Enhanced Ruby mode
                     ruby-end ;; Insert end for methods automatically
                     rspec-mode ;; RSpec yasnippets

                     ;; Elixir
                     alchemist

                     ;; Erlang
                     erlang

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

                     ;; Clojure
                     clojure-mode
                     cider

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
(load "~/.emacs.d/08ctags.el")
(load "~/.emacs.d/09ispell.el")
(load "~/.emacs.d/10themes.el")

;; Actual supported languages
(load "~/.emacs.d/20elisp.el")
(load "~/.emacs.d/20ruby.el")
(load "~/.emacs.d/20web.el")
(load "~/.emacs.d/20elixir.el")
(load "~/.emacs.d/20erlang.el")
(load "~/.emacs.d/20sh.el")
(load "~/.emacs.d/20rust.el")
(load "~/.emacs.d/20clang.el")
(load "~/.emacs.d/20clojure.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "8ffdc8c66ceeaf7921f4510a70d808f01b303e6b4d177c947b442e80d4228678" "b0c5c6cc59d530d3f6fbcfa67801993669ce062dda1435014f74cafac7d86246" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" default)))
 '(package-selected-packages
   (quote
    (planet-theme cider clojure-mode erlang rspec-mode crystal-mode dap-mode lsp-ui company-lsp lsp-mode nginx-mode gitignore-mode js2-mode keyfreq company-web visual-regexp enh-ruby-mode counsel-projectile counsel ivy flycheck-rust flycheck hydra solarized-theme company-ansible alchemist column-enforce-mode yaml-mode ansible dockerfile-mode ruby-end dash-at-point base16-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
