;;; python -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(declare-function icejam-set-eglot-capfs 'icejam-complete-at-point)
(declare-function column-enforce-n "column-enforce-mode" (number))
(declare-function transient-define-prefix 'transient)

(eval-when-compile
  (defvar icejam-language-transient-alist)
  (defvar icejam-python-lang-menu))

(transient-define-prefix icejam-python-lang-menu ()
  "Python Buffer Commands."
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

;; Add lookup for C-c l transient menu
(add-to-list
 'icejam-language-transient-alist '(python-mode . icejam-python-lang-menu))

;; Python template language
(use-package jinja2-mode :ensure t :defer t)

(defun icejam-lang-activate-python-mode ()
  "Activate python mode."
  (eglot-ensure)
  (column-enforce-n 99)

  ;; Capf override
  (icejam-set-eglot-capfs))

(add-hook 'python-mode-hook 'icejam-lang-activate-python-mode)

(provide 'icejam-lang-python)
;;; icejam-lang-python.el ends here
