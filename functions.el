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
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1))


;;;; Functions to update font size
(defun set-font-size (size)
  "Set font SIZE to X px."
  (interactive "NNew font size: ")
  (set-face-attribute 'default nil :font (format "Hasklig %d" size))
  (set-face-attribute 'helm-selection nil :font (format "Hasklig %d" size))
  (set-face-attribute 'helm-header nil :font
                      (format "Hasklig %d"
                              (+ size 2))))
;;; functions.el ends here
