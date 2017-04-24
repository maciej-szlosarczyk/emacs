;;; Functions -- summary
;;; Commentary:
;;; Code:
(defun kill-other-buffers ()
  "Kill all buffers except for the current one."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  )

(defun align-to-colon (begin end)
    "Align region from BEGIN to END according to colon signs."
    (align-regexp begin end
                  (rx ":" (group (zero-or-mode (syntax-white))))))
;;; functions.el ends here
