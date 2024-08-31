;;; +early-init.el --- summary

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
(setq garbage-collection-messages t)

;;; early-init.el ends here
