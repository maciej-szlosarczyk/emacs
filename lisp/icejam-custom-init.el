;;; icejam-custom-init.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; custom-init does a thing.

;;; Code:

;; Set GC at 500 MB for startup
(setq gc-cons-threshold 500000000)
(setq gc-cons-percentage 0.6)

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

(straight-use-package 'use-package)

;; I don't know why this needs to be here and with a lisp specifier, but
;; normal subdirs.el file doesn't work.
(normal-top-level-add-to-load-path '("lisp/themes" "lisp/langs"))

;; (add-to-list 'load-path (concat user-emacs-directory "pkg"))

;; General configuration files.
(require 'icejam-keys-mode)
(require 'icejam-base)
(require 'icejam-sys-specific)
(require 'icejam-ivy)
(require 'icejam-avy)
(require 'icejam-transient)
(require 'icejam-prog-mode)
(require 'icejam-company-yasnippet)
(require 'icejam-flycheck)
(require 'icejam-projectile)
(require 'icejam-ispell)
(require 'icejam-deft)
(require 'icejam-lsp)
(require 'icejam-dashboard)
(require 'icejam-magit)
(require 'icejam-vundo)
(require 'icejam-speed-type)

;; Themes
(require 'icejam-themes)
(require 'icejam-fonts)

;; Actual supported languages and file syntax.
(require '+custom-lang-clang "$HOME/.emacs.d/lang/clang.el")
(require '+custom-lang-clojure "$HOME/.emacs.d/lang/clojure.el")
(require '+custom-lang-common-lisp "$HOME/.emacs.d/lang/common-lisp.el")
(require '+custom-lang-dart "$HOME/.emacs.d/lang/dart.el")
(require '+custom-lang-dhall "$HOME/.emacs.d/lang/dhall.el")
(require '+custom-lang-elisp "$HOME/.emacs.d/lang/elisp.el")
(require '+custom-lang-elixir "$HOME/.emacs.d/lang/elixir.el")
(require '+custom-lang-erlang "$HOME/.emacs.d/lang/erlang.el")
(require '+custom-lang-fsharp "$HOME/.emacs.d/lang/fsharp.el")
(require '+custom-lang-gleam "$HOME/.emacs.d/lang/gleam.el")
(require '+custom-lang-golang "$HOME/.emacs.d/lang/golang.el")
(require '+custom-lang-haskell "$HOME/.emacs.d/lang/haskell.el")
(require '+custom-lang-javascript "$HOME/.emacs.d/lang/javascript.el")
(require '+custom-lang-kotlin "$HOME/.emacs.d/lang/kotlin.el")
(require '+custom-lang-lean "$HOME/.emacs.d/lang/lean.el")
(require '+custom-lang-markdown "$HOME/.emacs.d/lang/markdown.el")
(require '+custom-lang-ocaml "$HOME/.emacs.d/lang/ocaml.el")
(require '+custom-lang-other "$HOME/.emacs.d/lang/other.el")
(require '+custom-lang-php "$HOME/.emacs.d/lang/php.el")
(require '+custom-lang-purescript "$HOME/.emacs.d/lang/purescript.el")
(require '+custom-lang-python "$HOME/.emacs.d/lang/python.el")
(require '+custom-lang-ruby "$HOME/.emacs.d/lang/ruby.el")
(require '+custom-lang-rust "$HOME/.emacs.d/lang/rust.el")
(require '+custom-lang-sh "$HOME/.emacs.d/lang/sh.el")
(require '+custom-lang-web "$HOME/.emacs.d/lang/web.el")
(require '+custom-lang-ziglang "$HOME/.emacs.d/lang/ziglang.el")

;; Diminish modeline litter
(require 'icejam-diminish)

;; Restore GC to normal, but still high
(setq gc-cons-threshold 100000000)
(setq gc-cons-percentage 0.1)

(provide 'icejam-custom-init)
;;; icejam-custom-init.el ends here
