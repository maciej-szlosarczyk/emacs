;;; php.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; php related settings

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require '+custom-pkg-hydra "$HOME/.emacs.d/pkg/hydra.el")

(use-package php-mode
  :requires (lsp-mode lsp-ui)
  :straight t)

(defhydra my-php/context-hydra (:color teal :hint nil)
  "
   ^PHP actions^
^^^^^^^^-----------------------------------------------------------------------
_r_: Reload buffer
_i_: Indent buffer                 _m_: iMenu
"
  ("q" nil "cancel" :color blue)

  ("r" revert-buffer-no-confirm)
  ("i" indent-region)

  ("m" lsp-ui-imenu))

(defun activate-php-mode ()
  "All things php."
  (set-indent 4)
  (column-enforce-n 80)

  (define-key php-mode-map (kbd "C-c l") 'my-php/context-hydra/body)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'php-mode-hook 'activate-php-mode)

(provide '+custom-lang-php)
;;; php.el ends here
