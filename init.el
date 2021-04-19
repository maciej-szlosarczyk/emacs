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
(require '+custom-pkg-keys-mode "$HOME/.emacs.d/pkg/keys-mode.el")
(require '+custom-pkg-base "$HOME/.emacs.d/pkg/base.el")
(require '+custom-pkg-sys-specific "$HOME/.emacs.d/pkg/sys-specific.el")
(require '+custom-pkg-macros "$HOME/.emacs.d/pkg/macros.el")
(require '+custom-pkg-ivy "$HOME/.emacs.d/pkg/ivy.el")
(require '+custom-pkg-persp "$HOME/.emacs.d/pkg/persp.el")
(require '+custom-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")
(require '+custom-pkg-magit "$HOME/.emacs.d/pkg/magit.el")
(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-company-yasnippet "$HOME/.emacs.d/pkg/company-yasnippet.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require '+custom-pkg-projectile "$HOME/.emacs.d/pkg/projectile.el")
(require '+custom-pkg-ctags "$HOME/.emacs.d/pkg/ctags.el")
(require '+custom-pkg-ispell "$HOME/.emacs.d/pkg/ispell.el")
(require '+custom-pkg-deft "$HOME/.emacs.d/pkg/deft.el")
(require '+custom-pkg-lsp "$HOME/.emacs.d/pkg/lsp.el")
(require '+custom-pkg-dashboard "$HOME/.emacs.d/pkg/dashboard.el")
(require '+custom-pkg-undo-tree "$HOME/.emacs.d/pkg/undo-tree.el")
(require '+custom-pkg-avy "$HOME/.emacs.d/pkg/avy.el")
(require '+custom-pkg-term "$HOME/.emacs.d/pkg/term.el")
(require '+custom-pkg-speed-type "$HOME/.emacs.d/pkg/speed-type.el")

;; Themes
(require '+custom-themes "$HOME/.emacs.d/themes/themes.el")

;; Actual supported languages and file syntax.
(require '+custom-lang-elisp "$HOME/.emacs.d/lang/elisp.el")
(require '+custom-lang-common-lisp "$HOME/.emacs.d/lang/common-lisp.el")
(require '+custom-lang-ruby "$HOME/.emacs.d/lang/ruby.el")
(require '+custom-lang-web "$HOME/.emacs.d/lang/web.el")
(require '+custom-lang-javascript "$HOME/.emacs.d/lang/javascript.el")
(require '+custom-lang-elixir "$HOME/.emacs.d/lang/elixir.el")
(require '+custom-lang-erlang "$HOME/.emacs.d/lang/erlang.el")
(require '+custom-lang-gleam "$HOME/.emacs.d/lang/gleam.el")
(require '+custom-lang-fsharp "$HOME/.emacs.d/lang/fsharp.el")
(require '+custom-lang-sh "$HOME/.emacs.d/lang/sh.el")
(require '+custom-lang-rust "$HOME/.emacs.d/lang/rust.el")
(require '+custom-lang-haskell "$HOME/.emacs.d/lang/haskell.el")
(require '+custom-lang-clang "$HOME/.emacs.d/lang/clang.el")
(require '+custom-lang-clojure "$HOME/.emacs.d/lang/clojure.el")
(require '+custom-lang-ocaml "$HOME/.emacs.d/lang/ocaml.el")
(require '+custom-lang-kotlin "$HOME/.emacs.d/lang/kotlin.el")
(require '+custom-lang-purescript "$HOME/.emacs.d/lang/purescript.el")
(require '+custom-lang-php "$HOME/.emacs.d/lang/php.el")
(require '+custom-lang-markdown "$HOME/.emacs.d/lang/markdown.el")
(require '+custom-lang-other "$HOME/.emacs.d/lang/other.el")

;; Diminish modeline litter
(require '+custom-pkg-diminish "$HOME/.emacs.d/pkg/diminish.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(markdown-code-face ((t (:inherit fixed-pitch :family "Hack"))))
 '(mmm-default-submode-face ((t nil))))

;; Restore GC to normal, but still high
(setq gc-cons-threshold 100000000)

(provide 'init)
;;; init.el ends here
