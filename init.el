;;; init.el -- Summary
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
                     exec-path-from-shell ;; Allow to execute path from shell

                     rainbow-delimiters ;; Colorize matching parens
		                 rainbow-mode ;; Make color symbols like #FFF colorfull

				             magit ;; Git interface for Emacs
		                 diff-hl ;; Highlight diff (also useful for git)

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

                     ;; Elixir
                     alchemist

                     ;; Web
                     web-mode

                     ;; Infrastructure files
                     dockerfile-mode
                     terraform-mode
                     ansible

                     ;; Text files
                     yaml-mode
                     markdown-mode
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (hydra markdown-mode solarized-theme company-ansible alchemist window-purpose column-enforce-mode yaml-mode ansible dockerfile-mode ruby-end web-mode flymake-ruby rvm dash-at-point robe base16-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
