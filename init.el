;;; Init.el -- Summary
;;; Commentary:
;;; Code:
;; list the repositories containing them

;; Set GC at 300 MB for startup
(setq gc-cons-threshold 300000000)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents (package-refresh-contents))

;; install use-package, the workhorse of configuration
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;; General configuration files.
(require '01base "$HOME/.emacs.d/01base.el")
(require '01sys-specific "$HOME/.emacs.d/01sys-specific.el")
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
(require '10themes "$HOME/.emacs.d/themes/themes.el")

;; Actual supported languages and file syntax.
(require 'languages/elisp "$HOME/.emacs.d/languages/elisp.el")
(require 'languages/ruby "$HOME/.emacs.d/languages/ruby.el")
(require 'languages/web "$HOME/.emacs.d/languages/web.el")
(require 'languages/javascript "$HOME/.emacs.d/languages/javascript.el")
(require 'languages/elixir "$HOME/.emacs.d/languages/elixir.el")
(require 'languages/erlang "$HOME/.emacs.d/languages/erlang.el")
(require 'languages/sh "$HOME/.emacs.d/languages/sh.el")
(require 'languages/rust "$HOME/.emacs.d/languages/rust.el")
(require 'languages/haskell "$HOME/.emacs.d/languages/haskell.el")
(require 'languages/clang "$HOME/.emacs.d/languages/clang.el")
(require 'languages/clojure "$HOME/.emacs.d/languages/clojure.el")
(require 'languages/ocaml "$HOME/.emacs.d/languages/ocaml.el")
(require 'languages/markdown "$HOME/.emacs.d/languages/markdown.el")
(require 'languages/other "$HOME/.emacs.d/languages/other.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dante dash-at-point racer racer-mode flycheck-rust rust-mode haskell-mode dune which-key erlang gitignore-mode yaml-mode nginx-mode ansible terraform-mode dockerfile-mode reason-mode merlin tuareg clj-refactor cider clojure-mode elixir-mode js2-mode web-mode enh-ruby-mode ruby-end rspec-mode planet-theme flatui-theme base16-theme smart-mode-line lsp-ui lsp-mode deft counsel-projectile flycheck company yasnippet-snippets yasnippet visual-regexp column-enforce-mode rainbow-mode rainbow-delimiters magit hydra counsel keyfreq exec-path-from-shell buffer-move use-package))
 '(safe-local-variable-values
   '((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))

;; Improve font settings in Markdown code
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((((type graphic)) (:foreground "#dfaf8f")) (((min-colors 256)) (:foreground "brightred")) (t (:foreground "brightred"))))
 '(font-lock-type-face ((t (:foreground "#ffcb6b" :family "IBM Plex Mono"))))
 '(markdown-code-face ((t (:inherit fixed-pitch :family "IBM Plex Mono")))))

;; Restore GC to normal, but still high
(setq gc-cons-threshold 100000000)

(provide 'init)
;;; init.el ends here
