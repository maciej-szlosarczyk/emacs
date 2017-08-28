;;; Ruby -- summary
;;; Commentary:

;;; Code:
(require 'company)
(require 'ruby-mode)
(require 'robe)
(require 'rvm)
(require 'rspec-mode)
(defun ruby-mode-config ()
  "Setup editor for Ruby."
  (set-indent 2)
  ;; Do not align 'begin' and 'while' ;;
  (setq ruby-align-to-stmt-keywords '(if begin case elseif rescue))

  ;; Do not indent inside the parenthasis
  (setq ruby-deep-indent-paren nil)

  ;; Do not insert encoding comments
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Use robe
  (add-hook 'ruby-mode-hook 'robe-mode)
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    "Activate proper RVM on activation of Robe."
    (rvm-activate-corresponding-ruby))

  ;; Setup autocomplete for robe
  (eval-after-load 'company
    '(push 'company-robe company-backends))
  (add-hook 'robe-mode-hook 'ac-robe-setup)

  ;; User rspec-mode
  (add-hook 'ruby-mode-hook 'rspec-mode)
  (eval-after-load 'rspec-mode '(rspec-install-snippets))

  ;; Use web-mode for erb
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

(add-hook 'ruby-mode-hook 'ruby-mode-config)
(add-hook 'ruby-mode-hook 'set-width-80)

;; Use longer lines for HAML
(add-hook 'haml-mode-hook 'set-width-120)

(provide 'ruby)
;;; ruby.el ends here
