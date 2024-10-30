;;; common-lisp.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-company-yasnippet)

(use-package slime :ensure t)
(use-package slime-company :ensure t
  :requires (slime company))

(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-fancy slime-company slime-quicklisp slime-asdf))

(provide 'icejam-lang-common-lisp)
;;; icejam-lang-common-lisp.el ends here
