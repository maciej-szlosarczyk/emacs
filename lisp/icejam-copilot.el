;;; icejam-copilot.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;;; Copilot and other GPT stuff

;;; Code:
(use-package copilot
  :ensure (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))

(with-eval-after-load 'copilot
  ;; Do not enable copilot by default because it sorta sucks?
  ;; (add-hook 'prog-mode-hook 'copilot-mode)
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

;; Enable Anthropic Claude LLM support for chat (it also sucks)
(defcustom anthropic-api-key "api-key" "The value of your Anthropic API key."
  :type 'string
  :group 'icejam
  :initialize 'custom-initialize-set)

(use-package gptel :ensure t)
(with-eval-after-load 'gptel
  (setq
   gptel-model "claude-3-5-sonnet-20241022"
   gptel-backend (gptel-make-anthropic "Claude"
                   :stream t :key (lambda () anthropic-api-key))))

;; Pretend to be 'AI editor'.
(use-package elysium :ensure t)
(with-eval-after-load 'elysium
  (setq
   ;; The elysium buffer will be 1/3 your screen
   elysium-window-size 0.33
   ;; Elysium buffer will be vertical
   elysium-window-style 'vertical))

;; Merging with SMerge
(use-package smerge-mode :ensure nil)
(with-eval-after-load 'smerge-mode
  (add-hook 'prog-mode-hook #'smerge-mode))

(provide 'icejam-copilot)
;;; icejam-copilot.el ends here
