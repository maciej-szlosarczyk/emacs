;;; Ruby -- summary
;;; Commentary:

;;; Code:
(require 'elpy)
(require 'pyenv-mode)
;;========== Editor config =========================
(defun editor-config-python ()
  "Setup editor for Python."
  (set-indent 4)
  (set-width-79)
  (setq python-indent-guess-indent-offset 4)
  (setq python-indent-offset 4))

;;========== Code completion
(defun completion-config-python ()
  "Code completion and inspection for Python."
  (elpy-mode 1)
  (pyenv-mode 1)
  (company-mode 1)

  (flycheck-mode 1)
  (flymake-mode 1)

  (setq elpy-rpc-backend "jedi")
  (jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:complete-reply t)

  (set (make-local-variable 'company-backends)
       '((company-jedi elpy-company-backend company-capf company-dabbrev-code
                               company-yasnippet company-files))))

(add-hook 'python-mode-hook 'editor-config-python)
(add-hook 'python-mode-hook 'completion-config-python)

(provide 'python)
;;; python.el ends here
