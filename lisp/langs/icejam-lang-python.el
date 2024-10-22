;;; python -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-transient)

(declare-function lsp nil)
(declare-function column-enforce-n "column-enforce-mode" (number))

(transient-define-prefix icejam-python-lang-menu ()
  "Python Buffer Commands."
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

;; Add lookup for C-c l transient menu
(add-to-list
 'icejam-language-transient-alist '(python-mode . icejam-python-lang-menu))

(defun icejam-lang-activate-python-mode ()
  "Activate python mode."
  (lsp)
  (column-enforce-n 99)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'python-mode-hook 'icejam-lang-activate-python-mode)

(provide 'icejam-lang-python)
;;; icejam-lang-python.el ends here
