;;; ziglang.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; ziglang does a thing.

;;; Code:

(require '+custom-pkg-projectile "$HOME/.emacs.d/pkg/projectile.el")
(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")

(use-package zig-mode :straight t :defer t :requires (lsp))

(defun activate-zig-mode ()
  "Goodies for editing zig files."

  ;; Set column width to 100
  (column-enforce-n 100)

  ;; Set indentation to 4 chars
  (set-indent 4)
  (lsp))

(add-hook 'zig-mode-hook 'activate-zig-mode)

(provide '+custom-lang-ziglang)
;;; ziglang.el ends here
