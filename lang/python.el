;;; python -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require '+custom-pkg-prog-mode "$HOME/.emacs.d/pkg/prog-mode.el")
(require '+custom-pkg-projectile "$HOME/.emacs.d/pkg/projectile.el")

(transient-define-prefix +custom-lang-python/transient-context-menu ()
  "Python Buffer Commands"
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


(defun +custom-lang-python/activate-python-mode ()
  (lsp)

  (column-enforce-n 99)

  (define-key python-mode-map (kbd "C-c l") '+custom-lang-python/transient-context-menu)

  ;; Company list override
  (add-to-list (make-local-variable 'company-backends)
               '(company-capf company-yasnippet)))

(add-hook 'python-mode-hook '+custom-lang-python/activate-python-mode)

(provide '+custom-lang-python)
;;; python.el ends here
