;;; icejam-eglot -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Language Server Protocol Config
;;; Code:

(use-package eldoc-box :ensure t
  :hook ((emacs-lisp-mode . eldoc-box-hover-at-point-mode)
         (eglot--managed-mode . eldoc-box-hover-at-point-mode))
  :custom-face
  (eldoc-box-markdown-separator ((t (:inherit (fringe))))))

;; Add debugger support to emacs.
(use-package dape :ensure t)

(provide 'icejam-eglot)
;;; icejam-eglot.el ends here
