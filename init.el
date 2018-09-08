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

                     evil ;; Behave like VIM
		                 evil-leader ;; Allow to set leader key (usually space)
                     evil-nerd-commenter ;; Add comments to files

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

                     ;; Web
                     web-mode

                     ;; Infrastructure files
                     yaml-mode
                     dockerfile-mode
                     terraform-mode
                     ansible
                     )
      )

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Additional files
(load "~/.emacs.d/01mac.el")
(load "~/.emacs.d/02evil.el")
(load "~/.emacs.d/03ivy.el")
(load "~/.emacs.d/04magit.el")
(load "~/.emacs.d/05prog-mode.el")
(load "~/.emacs.d/06company-yasnippet.el")
(load "~/.emacs.d/07projectile.el")
(load "~/.emacs.d/08purpose.el")
(load "~/.emacs.d/10themes.el")

;; Actual supported languages
(load "~/.emacs.d/20elisp.el")
(load "~/.emacs.d/20ruby.el")
(load "~/.emacs.d/20web.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (window-purpose column-enforce-mode yaml-mode ansible dockerfile-mode evil-nerd-commenter ruby-end web-mode flymake-ruby rvm dash-at-point robe base16-theme exec-path-from-shell evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
