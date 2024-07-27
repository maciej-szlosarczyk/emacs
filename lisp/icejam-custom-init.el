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

;; I don't know why this needs to be here and with a lisp directory, but
;; normal subdirs.el file doesn't work.
(add-to-list 'load-path (concat user-emacs-directory "lisp/themes"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/langs"))

(defgroup :icejam nil "My customisation group.")

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
(require 'icejam-lang-clang)
(require 'icejam-lang-clojure)
(require 'icejam-lang-common-lisp)
(require 'icejam-lang-dart)
(require 'icejam-lang-dhall)
(require 'icejam-lang-elisp)
(require 'icejam-lang-elixir)
(require 'icejam-lang-erlang)
(require 'icejam-lang-fsharp)
(require 'icejam-lang-gleam)
(require 'icejam-lang-golang)
(require 'icejam-lang-haskell)
(require 'icejam-lang-javascript)
(require 'icejam-lang-kotlin)
(require 'icejam-lang-lean)
(require 'icejam-lang-markdown)
(require 'icejam-lang-ocaml)
(require 'icejam-lang-other)
(require 'icejam-lang-php)
(require 'icejam-lang-purescript)
(require 'icejam-lang-python)
(require 'icejam-lang-ruby)
(require 'icejam-lang-rust)
(require 'icejam-lang-sh)
(require 'icejam-lang-web)
(require 'icejam-lang-ziglang)

;; Diminish modeline litter
(require 'icejam-diminish)

;; Restore GC to normal, but still high
(setq gc-cons-threshold 100000000)
(setq gc-cons-percentage 0.1)

(provide 'icejam-custom-init)
;;; icejam-custom-init.el ends here
