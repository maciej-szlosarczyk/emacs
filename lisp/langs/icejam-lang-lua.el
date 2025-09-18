;;; icejam-lang-lua.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Lua mode

;;; Code:
(eval-when-compile
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
  (defvar icejam-language-transient-alist))

(use-package lua-mode :ensure t :defer t)

(defun icejam-activate-lua-mode ()
  "All things related to Lua."
  (icejam-set-indent 4)
  (column-enforce-n 100)
  (eglot-ensure)
  (icejam-set-eglot-capfs))

(add-hook 'lua-mode-hook 'icejam-activate-lua-mode)

(provide 'icejam-lang-lua)
;;; icejam-lang-lua.el ends here
