;;; icejam-custom-init.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; custom-init does a thing.

;;; Code:

;; Set GC at 500 MB for startup
(setq gc-cons-threshold 500000000)
(setq gc-cons-percentage 0.6)

;; Allow for deeper stacktraces / recursion
(setq max-lisp-eval-depth 10000)

;;; Use elpaca for package management.
(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
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

(setq use-package-verbose t)
(setq use-package-compute-statistics t)
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

(defun icejam-elpaca-write-lock ()
  "Write elpaca lock file."
  (interactive)
  (elpaca-write-lockfile (concat user-emacs-directory "elpaca.lock")))

;; I don't know why this needs to be here and with a lisp directory, but
;; normal subdirs.el file doesn't work.
(add-to-list 'load-path (concat user-emacs-directory "lisp/themes"))
(add-to-list 'load-path (concat user-emacs-directory "lisp/langs"))

(defgroup :icejam nil "My customisation group.")

;; General configuration files.
(require 'icejam-keys-mode)
(require 'icejam-blocking)
(require 'icejam-base)
(require 'icejam-sys-specific)
(require 'icejam-tree-sitter)
(require 'icejam-completing-read)
(require 'icejam-avy)
(require 'icejam-transient)
(require 'icejam-prog-mode)
(require 'icejam-company-yasnippet)
(require 'icejam-copilot)
(require 'icejam-flycheck)
(require 'icejam-ispell)
(require 'icejam-deft)
(require 'icejam-lsp)
(require 'icejam-dashboard)
(require 'icejam-magit)
(require 'icejam-vundo)
(require 'icejam-speed-type)

;; ;; Themes
(require 'icejam-themes)
(require 'icejam-fonts)

;; ;; Actual supported languages and file syntax.
(require 'icejam-lang-clang)
(require 'icejam-lang-clojure)
;; ;; (require 'icejam-lang-common-lisp)
(require 'icejam-lang-dart)
(require 'icejam-lang-dhall)
(require 'icejam-lang-elisp)
(require 'icejam-lang-elixir)
(require 'icejam-lang-erlang)
(require 'icejam-lang-fsharp)
(require 'icejam-lang-gleam)
(require 'icejam-lang-golang)
(require 'icejam-lang-haskell)
(require 'icejam-lang-javascript)
(require 'icejam-lang-kotlin)
(require 'icejam-lang-lean)
(require 'icejam-lang-markdown)
(require 'icejam-lang-ocaml)
(require 'icejam-lang-other)
(require 'icejam-lang-php)
(require 'icejam-lang-purescript)
(require 'icejam-lang-python)
(require 'icejam-lang-ruby)
(require 'icejam-lang-rust)
(require 'icejam-lang-sh)
(require 'icejam-lang-web)
(require 'icejam-lang-ziglang)

;; ;; Diminish modeline litter
(require 'icejam-diminish)

;; Restore GC to normal, but still high
(setq gc-cons-threshold 200000000)
(setq gc-cons-percentage 0.2)

(provide 'icejam-custom-init)
;;; icejam-custom-init.el ends here
