;;; 08ctags -- summary
;;; Commentary:
;;; Old and rudimental completion framework.
;;; Code:
(require 'projectile)

;; Do not mix ctags between folders
(provide 'my-ctags-config)

(setq tags-add-tables nil)

(defvar ctags/refresh-command
      (format "uctags -e -R -f %sTAGS %s."
              default-directory default-directory))

;; Sentinel function for capturing ctags
(defun ctags/process-callback (process event)
  "Show status of asynchronous ctags PROCESS after it send finished EVENT."
  (cond
   ((string-equal event "finished\n")
    (message "Creating tag files...completed")
    (kill-buffer (get-buffer "*ctags*"))
    (visit-tags-table (format "%sTAGS" (projectile-project-root))))
   (t
    (message "Creating tags file...failed")
    (pop-to-buffer (get-buffer "*ctags*"))
    )))

(cl-defun ctags/refresh-ctags (&key silent)
  "Refresh ctags according to currently set command."
  (interactive)

  ;; Print message if not silent
  (when (not silent) (message "Starting ctags process..."))

  ;; Return if a version of the process is already running
  (when (not (get-process "ctags"))
    (start-process-shell-command "ctags" "*ctags*" ctags/refresh-command)
    (set-process-sentinel (get-process "ctags") 'ctags/process-callback)))

;; Ctags bindings
(define-key prog-mode-map (kbd "C-c E") 'ctags/refresh-ctags)

;; Automatically update tags on save, but be silent about it.
(defvar ctags/major-modes-to-update-on-save '())
(defun ctags/update-tags-on-save ()
  "Update tags if current major mode is part of the list."
  (interactive)
  (when (member major-mode ctags/major-modes-to-update-on-save)
    (ctags/refresh-ctags :silent t)))

(defun ctags/update-this-mode-on-save (mode)
  "Update MODE on save."
  (add-to-list (make-local-variable 'ctags/major-modes-to-update-on-save) mode))

(add-hook 'after-save-hook 'ctags/update-tags-on-save)
(provide '08ctags)
;;; 08ctags.el ends here
