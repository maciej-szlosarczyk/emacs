;;; fsharp.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:
(eval-when-compile
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function column-enforce-n 'column-enforce-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(use-package fsharp-mode :ensure t :defer t)

(defun icejam-activate-fsharp-mode ()
  "Activate F# goodies."
  (icejam-set-indent 4)
  (column-enforce-n 100)
  (eglot-ensure)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'fsharp-mode-hook 'icejam-activate-fsharp-mode)

(provide 'icejam-lang-fsharp)
;;; icejam-lang-fsharp.el ends here
