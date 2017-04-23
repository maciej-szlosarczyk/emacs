(defun kill-other-buffers
    "Kill all buffers except for the current one"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  )

