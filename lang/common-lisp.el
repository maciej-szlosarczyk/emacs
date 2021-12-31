;;; common-lisp.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-company-yasnippet "$HOME/.emacs.d/pkg/company-yasnippet.el")

(use-package slime :straight t)
(use-package slime-company :straight t
  :requires (slime company))


(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-fancy slime-company slime-quicklisp slime-asdf))

(provide '+custom-lang-common-lisp)
;;; common-lisp.el ends here
