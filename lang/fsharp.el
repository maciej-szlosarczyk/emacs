;;; fsharp.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Fsharp configuration

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")

(use-package fsharp-mode
  :requires (lsp-mode lsp-ui)
  :straight t
  :defer t)

(defhydra my-fsharp/context-hydra (:color teal :hint nil)
  "
   ^Fsharp actions^
^^^^^^^^-----------------------------------------------------------------------
_r_: Reload buffer                 _f_: Format buffer
_i_: Indent buffer                 _m_: iMenu
"
  ("q" nil "cancel" :color blue)

  ("r" revert-buffer-no-confirm)
  ("i" indent-region)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu))

(defun activate-fsharp-mode ()
  "Activate F# goodies."
  (set-indent 4)
  (column-enforce-n 100)
  (lsp-deferred)
  (define-key fsharp-mode-map (kbd "C-c l") 'my-fsharp/context-hydra/body)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'fsharp-mode-hook 'activate-fsharp-mode)

(provide '+custom-lang-fsharp)
;;; fsharp.el ends here
