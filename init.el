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
(defvar package-list '(
                     use-package
                     visual-regexp ;; Regexp replacement with preview in
                     ;; current buffer.

                     ;; Themes
                     smart-mode-line
                     base16-theme
                     flatui-theme
                     planet-theme

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

(require 'use-package)

;; Additional files
(require '01mac "$HOME/.emacs.d/01mac.el")
(require '05macros "$HOME/.emacs.d/05macros.el")
(require '05ivy "$HOME/.emacs.d/05ivy.el")
(require '05hydra "$HOME/.emacs.d/05hydra.el")
(require '05magit "$HOME/.emacs.d/05magit.el")
(require '05prog-mode "$HOME/.emacs.d/05prog-mode.el")
(require '05company-yasnippet "$HOME/.emacs.d/05company-yasnippet.el")
(require '05flycheck "$HOME/.emacs.d/05flycheck.el")
(require '05projectile "$HOME/.emacs.d/05projectile.el")
(require '05ctags "$HOME/.emacs.d/05ctags.el")
(require '05ispell "$HOME/.emacs.d/05ispell.el")
(require '05deft "$HOME/.emacs.d/05deft.el")
(require '05lsp "$HOME/.emacs.d/05lsp.el")

;; Themes
(load "$HOME/.emacs.d/themes/themes.el" 'f 't)

;; Actual supported languages
(load "$HOME/.emacs.d/languages/elisp.el" 'f 't)
(load "$HOME/.emacs.d/languages/ruby.el" 'f 't)
(load "$HOME/.emacs.d/languages/web.el" 'f 't)
(load "$HOME/.emacs.d/languages/javascript.el" 'f 't)
(load "$HOME/.emacs.d/languages/elixir.el" 'f 't)
(load "$HOME/.emacs.d/languages/erlang.el" 'f 't)
(load "$HOME/.emacs.d/languages/sh.el" 'f 't)
(load "$HOME/.emacs.d/languages/rust.el" 'f 't)
(load "$HOME/.emacs.d/languages/clang.el" 'f 't)
(load "$HOME/.emacs.d/languages/clojure.el" 'f 't)
(load "$HOME/.emacs.d/languages/ocaml.el" 'f 't)
(load "$HOME/.emacs.d/languages/markdown.el" 'f 't)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1f38fb71e55e5ec5f14a39d03ca7d7a416123d3f0847745c7bade053ca58f043" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "8ffdc8c66ceeaf7921f4510a70d808f01b303e6b4d177c947b442e80d4228678" "b0c5c6cc59d530d3f6fbcfa67801993669ce062dda1435014f74cafac7d86246" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" default)))
 '(package-selected-packages
   (quote
    (lsp-ui lsp tuareg merlin reason-mode deft buffer-move clj-refactor planet-theme cider clojure-mode erlang rspec-mode dap-mode lsp-mode nginx-mode gitignore-mode js2-mode keyfreq visual-regexp enh-ruby-mode counsel-projectile counsel ivy flycheck-rust flycheck hydra solarized-theme company-ansible column-enforce-mode yaml-mode ansible dockerfile-mode ruby-end dash-at-point base16-theme exec-path-from-shell))))

;; Improve font settings in Markdown code
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((((type graphic)) (:foreground "#dfaf8f")) (((min-colors 256)) (:foreground "brightred")) (t (:foreground "brightred"))))
 '(font-lock-type-face ((t (:foreground "#ffcb6b" :family "IBM Plex Mono"))))
 '(markdown-code-face ((t (:inherit fixed-pitch :family "IBM Plex Mono")))))

(provide 'init)
;;; init.el ends here
