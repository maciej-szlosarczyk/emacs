;;; ziglang.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; ziglang does a thing.

;;; Code:
(require 'icejam-prog-mode)

(use-package zig-mode :straight t :defer t :requires (lsp))

(defun activate-zig-mode ()
  "Goodies for editing zig files."

  ;; Set column width to 100
  (column-enforce-n 100)

  ;; Set indentation to 4 chars
  (set-indent 4)
  (lsp))

(add-hook 'zig-mode-hook 'activate-zig-mode)

(provide 'icejam-lang-ziglang)
;;; icejam-lang-ziglang.el ends here
