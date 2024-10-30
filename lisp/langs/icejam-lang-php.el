;;; php.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; php related settings

;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-flycheck)
(require 'icejam-transient)

(use-package php-mode
  :requires (lsp-mode lsp-ui)
  :ensure t)

(transient-define-prefix icejam-lang-php/context-menu ()
  "PHP Buffer Commands."
  [""
   ["LSP"
    ("m" "iMenu"       lsp-ui-imenu)]
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      lsp-format-buffer)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("e" "Show Errors" flycheck-list-errors)]]
  [""
   ("q" "Quit"        keyboard-quit)])


(defun icejam-lang-activate-php-mode ()
  "All things php."
  (icejam-set-indent 4)
  (column-enforce-n 80)

  (define-key php-mode-map (kbd "C-c l") 'icejam-lang-php/context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'php-mode-hook 'icejam-lang-activate-php-mode)

(provide 'icejam-lang-php)
;;; icejam-lang-php.el ends here
