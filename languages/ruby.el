;;; Ruby -- summary
;;; Commentary:

;;; Code:
(require 'company)
(require 'ruby-mode)
(require 'robe)
(require 'rspec-mode)

;;========== Editor config =========================
(defun editor-ruby-mode-config ()
  "Setup editor for Ruby."

  ;; Indentation and line length
  (set-width-80)
  (set-indent 2)

  ;; Do not align 'begin' and 'while' ;;
  (setq ruby-align-to-stmt-keywords '(if begin case elseif rescue))

  ;; Do not indent inside the parenthasis
  (setq ruby-deep-indent-paren nil)

  ;; Do not insert encoding comments
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Use web-mode for erb
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

;;========== Rspec config =========================
(defun rspec-ruby-mode-config ()
  "Use rspec-mode."
  (rspec-mode t)
  (eval-after-load 'rspec-mode '(rspec-install-snippets)))

;;========== Robe config ==========================
(defun robe-ruby-mode-config ()
  "Use robe."
  ;; Activate modes
  (robe-mode 1)
  (company-mode 1)
  (rspec-mode 1)
  (flymake-mode 1)
  (flymake-ruby-load)

  ;; Activate RVM
  (rvm-activate-corresponding-ruby)

  ;; Initalize completion
  (set (make-local-variable 'company-backends)
       '((company-etags company-yasnippet company-files))))

;;========== Hooks ================================
(add-hook 'ruby-mode-hook 'editor-ruby-mode-config)
(add-hook 'ruby-mode-hook 'robe-ruby-mode-config)
(add-hook 'ruby-mode-hook 'rspec-ruby-mode-config)

;; Use longer lines for HAML
(add-hook 'haml-mode-hook 'set-width-120)

(provide 'ruby)
;;; ruby.el ends here
