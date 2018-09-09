;; Start rvm before starting robe
(require 'enh-ruby-mode)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)
(add-hook 'enh-ruby-mode-hook 'flymake-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(defun activate-ruby-mode ()
  "All things for ruby mode."
  (set-indent 2)

  ;; Set column enforcement at 80 for normal projects, and at 100 for work
  (if (string-match-p "internetee" (buffer-file-name))
      (column-enforce-n 100)
    (column-enforce-n 80))

  ;; Do not insert magic encoding comment at the begining of each file
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Start flymake
  (flymake-ruby-load))

(add-hook 'enh-ruby-mode-hook 'activate-ruby-mode)

;; Ruby specific key bindings
(define-key enh-ruby-mode-map (kbd "C-c j") 'robe-jump)

;;; ERB specific things
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("<%" "%>")
                   ("beg" "end")))
        ))
(add-hook 'web-mode-hook 'flymake-mode)
