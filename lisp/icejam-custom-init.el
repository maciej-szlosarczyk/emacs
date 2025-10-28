;;; icejam-custom-init.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; custom-init does a thing.

;;; Code:

;; Set GC at 500 MB for startup
(setopt gc-cons-threshold 500000000)
(setopt gc-cons-percentage 5.0)

(add-hook 'after-init-hook (lambda ()
                             ;; Restore GC to normal, but still high
                             (setopt gc-cons-threshold 204800000)
                             (setopt gc-cons-percentage 0.2)))

;; Allow for deeper stacktraces / recursion
;; (setopt max-lisp-eval-depth 10000)

;;; Use elpaca for package management.
(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Use package settings
(setopt use-package-verbose t)
(setopt use-package-compute-statistics t)

;; Enable use-package :ensure support for Elpaca.
(defvar elpaca-use-package)
(elpaca elpaca-use-package (elpaca-use-package-mode))

;; (elpaca-load-lockfile (concat user-emacs-directory "elpaca.lock"))
;; (setopt elpaca-lock-file (concat user-emacs-directory "elpaca.lock"))

(use-package benchmark-init :ensure (:wait t)
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(defun icejam-elpaca-write-lock ()
  "Write elpaca lock file."
  (interactive)
  (elpaca-write-lock-file (concat user-emacs-directory "elpaca.lock")))

;; I don't know why this needs to be here and with a lisp directory, but
;; normal subdirs.el file doesn't work.
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/themes"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/langs"))

(defgroup :icejam nil "My customisation group.")

;; General configuration files.
(use-package icejam-keys-mode :ensure nil)
(use-package icejam-base :ensure nil)
(use-package icejam-sys-specific :ensure nil)
(use-package icejam-tree-sitter :ensure nil)
(use-package icejam-completing-read :ensure nil)
(use-package icejam-avy :ensure nil)
(use-package icejam-transient :ensure nil)
(use-package icejam-prog-mode :ensure nil)
(use-package icejam-complete-at-point :ensure nil)
(use-package icejam-aider :ensure nil)
(use-package icejam-flycheck :ensure nil)
(use-package icejam-ispell :ensure nil)
(use-package icejam-deft :ensure nil)
(use-package icejam-eglot :ensure nil)
(use-package icejam-dashboard :ensure nil)
(use-package icejam-magit :ensure nil)
(use-package icejam-vundo :ensure nil)
(use-package icejam-speed-type :ensure nil)

;; Themes
(use-package icejam-themes :ensure nil)
(use-package icejam-fonts :ensure nil)

;; Actual supported languages and file syntax.
(use-package icejam-lang-clang :ensure nil)
(use-package icejam-lang-clojure :ensure nil)
(use-package icejam-lang-dart :ensure nil)
(use-package icejam-lang-dhall :ensure nil)
(use-package icejam-lang-elisp :ensure nil)
(use-package icejam-lang-elixir :ensure nil)
(use-package icejam-lang-erlang :ensure nil)
(use-package icejam-lang-fsharp :ensure nil)
(use-package icejam-lang-gleam :ensure nil)
(use-package icejam-lang-golang :ensure nil)
(use-package icejam-lang-haskell :ensure nil)
(use-package icejam-lang-javascript :ensure nil)
(use-package icejam-lang-kotlin :ensure nil)
;; (use-package icejam-lang-lean :ensure nil)
(use-package icejam-lang-lua :ensure nil)
(use-package icejam-lang-markdown :ensure nil)
(use-package icejam-lang-ocaml :ensure nil)
(use-package icejam-lang-other :ensure nil)
(use-package icejam-lang-php :ensure nil)
(use-package icejam-lang-purescript :ensure nil)
(use-package icejam-lang-python :ensure nil)
(use-package icejam-lang-ruby :ensure nil)
(use-package icejam-lang-rust :ensure nil)
(use-package icejam-lang-sh :ensure nil)
(use-package icejam-lang-web :ensure nil)
(use-package icejam-lang-ziglang :ensure nil)

;; Diminish modeline litter
(use-package icejam-diminish :ensure nil)

(provide 'icejam-custom-init)
;;; icejam-custom-init.el ends here
