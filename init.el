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
                     tern
                     company-tern

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
 '(package-selected-packages
   (quote
    (cider clojure-mode erlang rspec-mode crystal-mode dap-mode lsp-ui company-lsp lsp-mode nginx-mode gitignore-mode js2-mode keyfreq company-web visual-regexp enh-ruby-mode counsel-projectile counsel ivy flycheck-rust flycheck hydra solarized-theme company-ansible alchemist column-enforce-mode yaml-mode ansible dockerfile-mode ruby-end dash-at-point base16-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
