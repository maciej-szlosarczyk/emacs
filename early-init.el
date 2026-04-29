;;; +early-init.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; early-init does a thing.

;;; Code:
;; Disable built-in package management
(setq package-enable-at-startup nil)
;; (add-to-list 'default-frame-alist '(undecorated . t))
;; (add-to-list 'default-frame-alist '(undecorated-round . t))

;; Log garbage collection.
(setq garbage-collection-messages nil)

;; Monitor startup time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Load secrets file before doing anything else:
(let ((secrets-file (concat user-emacs-directory "icejam-secrets.el")))
  (when (file-exists-p secrets-file)
    (load secrets-file)))
;;; early-init.el ends here
