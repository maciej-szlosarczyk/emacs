;;; icejam-aider.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Copilot and other GPT stuff

;;; Code:
(use-package aidermacs :ensure (:host github :repo "MatthewZMD/aidermacs")
  :defer t
  :config
  ;; (setenv "OLLAMA_API_BASE" "http://127.0.0.1:11434")
  (setenv "OLLAMA_API_BASE" "http://192.168.88.13:11434")
  (setopt aidermacs-default-chat-mode 'architect)
  (setopt aidermacs-default-model "ollama_chat/qwen3-coder:30b")
  (setopt aider-extra-args (list "--model"
                                 "ollama_chat/qwen3-coder:30b"
                                 "--no-auto-commits"
                                 "--no-analytics"
                                 "--no-gitignore")))

(declare-function agent-shell-make-environment-variables 'agent-shell)

(use-package agent-shell
  :ensure t
  :ensure-system-package
  ;; Add agent installation configs here
  ((claude-agent-acp . "npm install -g @zed-industries/claude-agent-acp"))
  :config
  (setopt agent-shell-anthropic-claude-environment
          (agent-shell-make-environment-variables :inherit-env t)))

(provide 'icejam-aider)
;;; icejam-aider.el ends here
