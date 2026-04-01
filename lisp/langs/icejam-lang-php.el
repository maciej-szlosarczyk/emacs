;;; icejam-lang-php.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; php related settings

;;; Code:
(eval-when-compile
  (defvar icejam-language-transient-alist)
  (defvar icejam-php-lang-menu)
  (declare-function column-enforce-n 'column-enforce-mode (number))
  (declare-function icejam-set-indent 'icejam-prog-mode)
  (declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
  (declare-function transient-define-prefix 'transient))

(use-package php-mode :ensure t :defer t)

(transient-define-prefix icejam-php-lang-menu ()
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

(add-to-list
 'icejam-language-transient-alist '(php-mode . icejam-php-lang-menu))

(defun icejam-activate-php-mode ()
  "All things php."
  (icejam-set-indent 4)
  (column-enforce-n 80)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'php-mode-hook 'icejam-activate-php-mode)

(provide 'icejam-lang-php)
;;; icejam-lang-php.el ends here
