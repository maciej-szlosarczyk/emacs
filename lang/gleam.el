;;; gleam.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Gleam language support

;;; Code:

(use-package gleam-mode
  :straight `(gleam-mode :type git :host github :repo "gleam-lang/gleam-mode")
  :mode "\\.gleam\\'")

(provide 'icejam-lang-gleam)
;;; gleam.el ends here
