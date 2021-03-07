;;; Init.el -- Summary
;;; Commentary:
;;; Code:
;; list the repositories containing them

;; Set GC at 300 MB for startup
(setq gc-cons-threshold 300000000)

;;; Use straight.el for package management
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)

(straight-use-package 'use-package)

;; General configuration files.
(require 'icejam-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")
(require 'icejam-pkg-base "$HOME/.emacs.d/pkg/base.el")
(require 'icejam-pkg-sys-specific "$HOME/.emacs.d/pkg/sys-specific.el")
(require 'icejam-pkg-macros "$HOME/.emacs.d/pkg/macros.el")
(require 'icejam-pkg-ivy "$HOME/.emacs.d/pkg/ivy.el")
(require 'icejam-pkg-persp "$HOME/.emacs.d/pkg/persp.el")
(require 'icejam-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")
(require 'icejam-pkg-magit "$HOME/.emacs.d/pkg/magit.el")
(require 'icejam-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require 'icejam-pkg-company-yasnippet "$HOME/.emacs.d/pkg/company-yasnippet.el")
(require 'icejam-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require 'icejam-pkg-projectile "$HOME/.emacs.d/pkg/projectile.el")
(require 'icejam-pkg-ctags "$HOME/.emacs.d/pkg/ctags.el")
(require 'icejam-pkg-ispell "$HOME/.emacs.d/pkg/ispell.el")
(require 'icejam-pkg-deft "$HOME/.emacs.d/pkg/deft.el")
(require 'icejam-pkg-lsp "$HOME/.emacs.d/pkg/lsp.el")
(require 'icejam-pkg-dashboard "$HOME/.emacs.d/pkg/dashboard.el")
(require 'icejam-pkg-undo-tree "$HOME/.emacs.d/pkg/undo-tree.el")
(require 'icejam-pkg-avy "$HOME/.emacs.d/pkg/avy.el")
(require 'icejam-pkg-term "$HOME/.emacs.d/pkg/term.el")

;; Themes
(require 'icejam-themes "$HOME/.emacs.d/themes/themes.el")

;; Actual supported languages and file syntax.
(require 'icejam-lang-elisp "$HOME/.emacs.d/lang/elisp.el")
(require 'icejam-lang-ruby "$HOME/.emacs.d/lang/ruby.el")
(require 'icejam-lang-web "$HOME/.emacs.d/lang/web.el")
(require 'icejam-lang-javascript "$HOME/.emacs.d/lang/javascript.el")
(require 'icejam-lang-elixir "$HOME/.emacs.d/lang/elixir.el")
(require 'icejam-lang-erlang "$HOME/.emacs.d/lang/erlang.el")
(require 'icejam-lang-gleam "$HOME/.emacs.d/lang/gleam.el")
(require 'icejam-lang-fsharp "$HOME/.emacs.d/lang/fsharp.el")
(require 'icejam-lang-sh "$HOME/.emacs.d/lang/sh.el")
(require 'icejam-lang-rust "$HOME/.emacs.d/lang/rust.el")
(require 'icejam-lang-haskell "$HOME/.emacs.d/lang/haskell.el")
(require 'icejam-lang-clang "$HOME/.emacs.d/lang/clang.el")
(require 'icejam-lang-clojure "$HOME/.emacs.d/lang/clojure.el")
(require 'icejam-lang-ocaml "$HOME/.emacs.d/lang/ocaml.el")
(require 'icejam-lang-purescript "$HOME/.emacs.d/lang/purescript.el")
(require 'icejam-lang-php "$HOME/.emacs.d/lang/php.el")
(require 'icejam-lang-markdown "$HOME/.emacs.d/lang/markdown.el")
(require 'icejam-lang-other "$HOME/.emacs.d/lang/other.el")

;; Diminish modeline litter
(require 'icejam-pkg-diminish "$HOME/.emacs.d/pkg/diminish.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(perspective apropospriate-theme jenkinsfile-mode vue-mode dap-mode undo-tree helpful lsp-haskell dashboard fsharp-mode dash-at-point racer racer-mode flycheck-rust rust-mode haskell-mode dune which-key erlang gitignore-mode yaml-mode nginx-mode ansible terraform-mode dockerfile-mode reason-mode merlin tuareg clj-refactor cider clojure-mode elixir-mode js2-mode web-mode enh-ruby-mode ruby-end rspec-mode planet-theme flatui-theme base16-theme smart-mode-line lsp-ui lsp-mode deft counsel-projectile flycheck company yasnippet-snippets yasnippet visual-regexp column-enforce-mode rainbow-mode rainbow-delimiters magit hydra counsel keyfreq exec-path-from-shell buffer-move use-package))
 '(safe-local-variable-values
   '((column-enforce-column . 10000)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))

;; Improve font settings in Markdown code
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((((type graphic)) (:foreground "#dfaf8f")) (((min-colors 256)) (:foreground "brightred")) (t (:foreground "brightred"))))
 '(font-lock-type-face ((t (:foreground "#ffcb6b" :family "Hack"))))
 '(markdown-code-face ((t (:inherit fixed-pitch :family "Hack")))))

;; Restore GC to normal, but still high
(setq gc-cons-threshold 100000000)

(provide 'init)
;;; init.el ends here
