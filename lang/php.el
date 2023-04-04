;;; php.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; php related settings

;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-flycheck "$HOME/.emacs.d/pkg/flycheck.el")
(require '+custom-pkg-transient "$HOME/.emacs.d/pkg/transient.el")

(use-package php-mode
  :requires (lsp-mode lsp-ui)
  :straight t)

(transient-define-prefix +custom-lang-php/context-menu ()
  "PHP Buffer Commands"
  [""
   ["LSP"
    ("m" "iMenu"       lsp-ui-imenu)]
   ["Buffer"
    ("r" "Reload"      revert-buffer-no-confirm)
    ("f" "Format"      lsp-format-buffer)
    ("i" "Indent"      mark-and-indent-whole-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])


(defun +custom-lang-php/activate-php-mode ()
  "All things php."
  (set-indent 4)
  (column-enforce-n 80)

  (define-key php-mode-map (kbd "C-c l") '+custom-lang-php/context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'php-mode-hook '+custom-lang-php/activate-php-mode)

(provide '+custom-lang-php)
;;; php.el ends here
