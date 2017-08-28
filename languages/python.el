;;; Ruby -- summary
;;; Commentary:

;;; Code:
(require 'elpy)
(require 'pyenv-mode)
(require 'company-jedi)

;;========== Editor config =========================
(defun editor-config-python ()
  "Setup editor for Python."
  (set-indent 4)
  (set-width-79)
  (setq python-indent-guess-indent-offset 4)
  (setq python-indent-offset 4))

;;========== Helper for pyenv ======================
(defun ssbb-pyenv-hook ()
  "Automatically activates pyenv version if .python-version file exists."
  (f-traverse-upwards
   (lambda (path)
     (let ((pyenv-version-path (f-expand ".python-version" path)))
       (if (f-exists? pyenv-version-path)
           (pyenv-mode-set (s-trim (f-read-text pyenv-version-path 'utf-8))))))))

(add-hook 'find-file-hook 'ssbb-pyenv-hook)

;;========== Code completion =======================
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
