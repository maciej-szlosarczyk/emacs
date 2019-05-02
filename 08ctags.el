;; Do not mix ctags between folders
(setq tags-add-tables nil)

;; Sentinel function for capturing ctags
(defun ctags-process-callback (process event)
  "Show status of asynchronous ctags-process after it finishes."
  (cond
   ((string-equal event "finished\n")
    (message "Creating tag files...completed")
    (kill-buffer (get-buffer "*ctags*"))
    (visit-tags-table (format "%sTAGS" (projectile-project-root))))
   (t
    (message "Creating tags file...failed")
    (pop-to-buffer (get-buffer "*ctags*"))
    )))

(setq ctags-refresh-command
      (format "ctags -e -R -f %sTAGS %s."
              default-directory default-directory))

(defun refresh-ctags ()
  "Refresh ctags according to currently set command."
  (interactive)

  (message "Starting ctags process")
  (start-process-shell-command "ctags" "*ctags*" ctags-refresh-command)
  (set-process-sentinel (get-process "ctags") 'ctags-process-callback))

;; Ctags bindings
(define-key prog-mode-map (kbd "C-c E") 'refresh-ctags)
