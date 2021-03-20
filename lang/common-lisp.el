;;; common-lisp.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(use-package slime :straight t)

(slime-setup '(slime-fancy slime-quicklisp slime-asdf))

(provide '+custom-lang-common-lisp)
;;; common-lisp.el ends here
