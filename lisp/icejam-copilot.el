;;; icejam-copilot.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Copilot and other GPT stuff

;;; Code:
(use-package copilot
  :ensure (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :bind (:map copilot-completion-map
              ("<tab>" . copilot-accept-completion)
              ("TAB" . copilot-accept-completion)))

;; Do not enable copilot by default because it sorta sucks?
;; (add-hook 'prog-mode-hook 'copilot-mode)
;; (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
;; (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

;; Enable Anthropic Claude LLM support for chat (it also sucks)
(defcustom anthropic-api-key "api-key" "The value of your Anthropic API key."
  :type 'string
  :group 'icejam
  :initialize 'custom-initialize-set)

(use-package gptel :ensure t
  :config
  (setq
   gptel-model "claude-3-5-sonnet-20240620"
   gptel-backend (gptel-make-anthropic "Claude"
                   :stream t
                   :key (lambda () anthropic-api-key))))


;; Pretend to be 'AI editor'.
(use-package elysium :ensure t
  :custom
  (elysium-window-size 0.33) ; The elysium buffer will be 1/3 your screen
  (elysium-window-style 'vertical)) ; Can be customized to horizontal

;; Merging with SMerge
(use-package smerge-mode :ensure nil :hook (prog-mode . smerge-mode))

(provide 'icejam-copilot)
;;; icejam-copilot.el ends here
