;;; icejam-agent-shell.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Agent stuff

;;; Code:
(declare-function agent-shell-make-environment-variables 'agent-shell)
(defvar icejam-variables-to-load-in-agent-shell '())

(use-package agent-shell
  :ensure t
  ;; Install this only on MacOS. On Linux you want to do it manually.
  :if (eq system-type 'darwin)
  :ensure-system-package
  ((claude-agent-acp . "npm install -g @zed-industries/claude-agent-acp"))
  :config
  (setopt agent-shell-anthropic-claude-environment
          (agent-shell-make-environment-variables :inherit-env t))
  (setopt agent-shell-opencode-environment
          (apply #'agent-shell-make-environment-variables
                 :inherit-env t
                 icejam-variables-to-load-in-agent-shell))
  (setopt
   agent-shell-opencode-default-model-id
   "google-vertex-anthropic/claude-sonnet-4-6@default"))

(provide 'icejam-agent-shell)
;;; icejam-agent-shell.el ends here
