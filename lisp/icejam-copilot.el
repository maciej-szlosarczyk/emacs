;;; icejam-copilot.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Copilot and other GPT stuff

;;; Code:
(use-package copilot :ensure (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :defer t
  ;; It sort of sucks so let's disable it.
  ;; :hook ((prog-mode . copilot-mode))
  :bind (:map copilot-completion-map
              ([tab] . copilot-accept-completion))
  :config
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode . 2)))

;; Enable Anthropic Claude LLM support for chat (it also sucks)
(defcustom anthropic-api-key "api-key" "The value of your Anthropic API key."
  :type 'string
  :group 'icejam
  :initialize 'custom-initialize-set)

(use-package gptel :ensure t :defer t
  :config
  (declare-function gptel-make-anthropic "gptel")
  (declare-function gptel-make-ollama "gptel")
  (gptel-make-ollama "Ollama@Linux"
    :host "192.168.88.110:11434"
    :stream t
    :models '(qwen2.5-coder:7b qwen2.5-coder:14b))
  (setq
   gptel-model 'claude-3-5-sonnet-20241022
   gptel-backend (gptel-make-anthropic "Claude"
                   :stream t :key (lambda () anthropic-api-key))))

;; Pretend to be 'AI editor' vol 1. Before usage make sure aider is installed:
;; $ pip install aider-install
;; $ aider install
(use-package aider :ensure (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :defer t
  :config
  ;; (setenv "OLLAMA_API_BASE" "http://127.0.0.1:11434")
  (setenv "OLLAMA_API_BASE" "http://192.168.88.110:11434")
  (setopt aider-args (list "--model"
                           "ollama_chat/qwen2.5-coder:14b"
                           "--no-auto-commits"
                           "--no-analytics"
                           "--no-gitignore")))

;; Pretend to be 'AI editor' vol 2.
(use-package elysium :ensure t :defer t
  :config
  (setopt
   ;; The elysium buffer will be 1/3 your screen
   elysium-window-size 0.33
   ;; Elysium buffer will be vertical
   elysium-window-style 'vertical))

;; Merging with SMerge
(use-package smerge-mode :ensure nil
  :hook ((prog-mode . smerge-mode)))

(provide 'icejam-copilot)
;;; icejam-copilot.el ends here
