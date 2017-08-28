;;; Ruby -- summary
;;; Commentary:

;;; Code:
(require 'elpy)
(defun python-mode-config ()
  "Setup editor for Python."
  (remove-hook 'ruby-mode-hook 'ruby-mode-config)
  (remove-hook 'elixir-mode-hook 'elixir-mode-config)
  (remove-hook 'emacs-lisp-mode-hook 'elisp-mode-config)
  (remove-hook 'html-mode-hook 'web-mode-config)
  (remove-hook 'haskell-mode-hook 'haskell-mode-config)
  (remove-hook 'java-mode-hook 'java-mode-config)

  (set-indent 4))

(setq elpy-rpc-python-command "python3")
(setq python-indent-guess-indent-offset 4)
(setq python-indent-offset 4)

(add-hook 'python-mode-hook 'python-mode-config)
(add-hook 'python-mode-hook 'pyenv-mode)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'set-width-79)

(provide 'python)
;;; python.el ends here
