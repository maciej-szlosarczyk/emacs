;;; ziglang.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; ziglang does a thing.

;;; Code:
(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point))

(use-package zig-mode :ensure t :defer t)

(defun icejam-activate-zig-mode ()
  "Goodies for editing zig files."

  ;; Set column width to 100
  (column-enforce-n 100)

  ;; Set indentation to 4 chars
  (icejam-set-indent 4)
  (eglot-ensure)
  (icejam-set-eglot-capfs))

(add-hook 'zig-mode-hook 'icejam-activate-zig-mode)

(provide 'icejam-lang-ziglang)
;;; icejam-lang-ziglang.el ends here
