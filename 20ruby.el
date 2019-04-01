;; Start rvm before starting robe
(require 'enh-ruby-mode)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; Refresh tags in Ruby projects
(defun ruby-refresh-etags ()
  "Recreate ctags for ruby"
  (interactive)

  (message "Refreshing Ruby ctags.")

  (shell-command
    (format "ctags -e -R --languages=ruby --exclude=.git --exclude=log -f %sTAGS %s. $(bundle list --paths)"
            (projectile-project-root) (projectile-project-root)))

  (visit-tags-table (format "%sTAGS" (projectile-project-root)))

  (message "Refresh finished."))

;; Ruby specific key bindings
(define-key enh-ruby-mode-map (kbd "C-c j") 'robe-jump)
(define-key enh-ruby-mode-map (kbd "C-c E") 'ruby-refresh-etags)
(define-key enh-ruby-mode-map (kbd "C-c \\") 'nil)

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(defun activate-ruby-mode ()
  "All things for ruby mode."
  (set-indent 2)

  ;; Set column enforcement at 80 for normal projects, and at 100 for work
  (if (string-match-p "internetee" (buffer-file-name))
      (column-enforce-n 100)
    (column-enforce-n 80))

  ;; Do not insert magic encoding comment at the begining of each file
  (setq ruby-insert-encoding-magic-comment nil))

(add-hook 'enh-ruby-mode-hook 'activate-ruby-mode)

;;; ERB specific things
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("<%" "%>")
                   ("beg" "end")))
        ))
