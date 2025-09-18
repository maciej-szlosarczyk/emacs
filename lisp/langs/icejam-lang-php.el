;;; php.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; php related settings

;;; Code:
(declare-function column-enforce-n 'column-enforce-mode (number))
(declare-function icejam-set-indent 'icejam-prog-mode)
(declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
(eval-when-compile (defvar icejam-language-transient-alist))

(use-package php-mode :ensure t :defer t)

(transient-define-prefix icejam-lang-php-context-menu ()
  "PHP Buffer Commands."
  [""
   ["LSP"
    ("m" "iMenu"       consult-imenu)]
   ["Buffer"
    ("r" "Reload"      icejam-revert-buffer-no-confirm)
    ("f" "Format"      eglot-format-buffer)
    ("i" "Indent"      icejam-mark-and-indent-whole-buffer)
    ("e" "Show Errors" flymake-show-buffer-diagnostics)]]
  [""
   ("q" "Quit"        keyboard-quit)])


(defun icejam-lang-activate-php-mode ()
  "All things php."
  (icejam-set-indent 4)
  (column-enforce-n 80)

  (keymap-set php-mode-map "C-c l" #'icejam-lang-php-context-menu)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'php-mode-hook 'icejam-lang-activate-php-mode)

(provide 'icejam-lang-php)
;;; icejam-lang-php.el ends here
