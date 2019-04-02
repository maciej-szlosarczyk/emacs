;; Require Enhanced Ruby Mode
(require 'enh-ruby-mode)

;; Refresh tags in Ruby projects
(defun ruby-refresh-etags ()
  "Recreate ctags for Ruby."
  (interactive)

  (message "Starting ctags process")
  (start-process-shell-command "ctags" "*ctags*"
   (format "ctags -e -R --languages=ruby -f %sTAGS %s. $(bundle list --paths)"
           (projectile-project-root) (projectile-project-root)))
  (set-process-sentinel (get-process "ctags") 'ctags-process-callback))

;; Ruby specific key bindings
(define-key enh-ruby-mode-map (kbd "C-c E") 'ruby-refresh-etags)
(define-key enh-ruby-mode-map (kbd "C-c \\") 'nil)

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'rspec-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)

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
