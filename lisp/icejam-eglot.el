;;; icejam-eglot -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Global Language Server Protocol Config
;;; Code:

(use-package eldoc-box
  :ensure (:host github :repo "casouri/eldoc-box" :ref "595262ec8ff56e8f86ef77d8e69339e84117e5f0")
  :hook ((emacs-lisp-mode . eldoc-box-hover-at-point-mode)
         (eglot--managed-mode . eldoc-box-hover-at-point-mode))
  :custom-face
  (eldoc-box-markdown-separator ((t (:inherit (fringe))))))

;; Add debugger support to emacs.
(use-package dape :ensure t)

(provide 'icejam-eglot)
;;; icejam-eglot.el ends here
