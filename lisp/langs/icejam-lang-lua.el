;;; icejam-lang-lua.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Lua mode

;;; Code:
(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function lsp 'lsp-mode)
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-lsp-capfs 'icejam-complete-at-point)
  (defvar icejam-language-transient-alist))

(use-package lua-mode :ensure t :defer t :after (lsp-mode))

(defun icejam-activate-lua-mode ()
  "All things related to Lua."
  (icejam-set-indent 4)
  (column-enforce-n 100)
  (lsp)
  (icejam-set-lsp-capfs))

(add-hook 'lua-mode-hook 'icejam-activate-lua-mode)

(provide 'icejam-lang-lua)
;;; icejam-lang-lua.el ends here
