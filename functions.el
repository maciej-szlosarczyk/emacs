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
  (set-face-attribute 'mode-line nil :font (format "Hasklig %d" size))
  (set-face-attribute 'helm-selection nil :font (format "Hasklig %d" size))
  (set-face-attribute 'helm-header nil :font
                      (format "Hasklig %d"
                              (+ size 2))))

;;;; Functions related to compilation of files
(defun byte-compile-init-dir ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

;; Always start in fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(toggle-fullscreen)
;;; functions.el ends here
