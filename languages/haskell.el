;;; haskell.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Provides configuration for haskell files

;;; Code:

(require 'pkg/prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require 'pkg/flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require 'pkg/hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package haskell-mode
  :ensure t
  :defer t)

(use-package lsp-haskell
  :ensure t
  :defer t
  :requires (lsp-mode lsp-ui haskell-mode)
  :config
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper"))

(defhydra my-haskell/context-hydra (:color teal :hint nil)
  "
  Haskell actions

   ^Haskell^                          ^Actions^
^^^^^^^^-----------------------------------------------------------------------
_f_: Format buffer
_i_: imenu
"
  ("q" nil "cancel" :color blue)

  ("f" lsp-format-buffer)
  ("i" lsp-ui-imenu))

(defun activate-haskell-mode ()
  "Run this in haskell-mode."
  (set-indent 2)
  (column-enforce-n 80)
  (lsp)
  (define-key haskell-mode-map (kbd "C-c l") 'my-haskell/context-hydra/body)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'haskell-mode-hook 'activate-haskell-mode)

(provide 'languages/haskell)
;;; haskell.el ends here
