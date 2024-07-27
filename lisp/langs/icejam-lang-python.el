;;; python -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'icejam-prog-mode)
(require 'icejam-transient)

(transient-define-prefix icejam-lang-python/transient-context-menu ()
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


(defun icejam-lang-python/activate-python-mode ()
  (lsp)

  (column-enforce-n 99)

  (define-key python-mode-map (kbd "C-c l") 'icejam-lang-python/transient-context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'python-mode-hook 'icejam-lang-python/activate-python-mode)

(provide 'icejam-lang-python)
;;; icejam-lang-python.el ends here
