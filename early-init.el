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

;; set path for native compilation to work
(setenv "PATH" "/Users/maciej/.local/share/zinit/polaris/bin:/Users/maciej/.asdf/shims:/Users/maciej/.local/bin:/Users/maciej/.opam/default/bin:/Users/maciej/.go/bin:/Users/maciej/.elan/bin:/opt/homebrew/opt/postgresql@17/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/MacGPG2/bin:/usr/local/share/dotnet:/Users/maciej/.dotnet/tools:/Applications/Postgres.app/Contents/Versions/latest/bin:/Applications/kitty.app/Contents/MacOS")
(setq exec-path (split-string (getenv "PATH") path-separator))

;;; early-init.el ends here
