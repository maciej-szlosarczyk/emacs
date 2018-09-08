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
  (if (string-match-p "internetee" (buffer-file-name))
      (set-width-100)
    (set-width-80))

  ;; Set default indentation
  (set-indent 2)

  ;; Do not align 'begin' and 'while' ;;
  (setq ruby-align-to-stmt-keywords '(if begin case elseif rescue))

  ;; Do not indent inside the parenthasis
  ;; (setq ruby-deep-indent-paren nil)

  ;; Automatically insert second pair of <%
  (define-key web-mode-map "<%" 'electric-pair)

  ;; Do not insert encoding comments
  (setq ruby-insert-encoding-magic-comment nil))

;;========== Rspec config =========================
(defun rspec-ruby-mode-config ()
  "Use rspec-mode."
  (rspec-mode t)
  (eval-after-load 'rspec-mode '(rspec-install-snippets)))

;;========== Minitest config ======================
(defun minitest-ruby-mode-config ()
  "Use minitest-mode."
  (minitest-mode t)
  (eval-after-load 'minitest-mode '(minitest-install-snippets)))

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
       '((company-yasnippet company-robe company-etags company-dabbrev-code company-files))))

;;========== Hooks ================================
(add-hook 'ruby-mode-hook 'editor-ruby-mode-config)
(add-hook 'ruby-mode-hook 'robe-ruby-mode-config)
(add-hook 'ruby-mode-hook 'rspec-ruby-mode-config)
(add-hook 'ruby-mode-hook 'minitest-ruby-mode-config)

;; Use longer lines for HAML
(add-hook 'haml-mode-hook 'set-width-100)

(provide 'ruby)
;;; ruby.el ends here
