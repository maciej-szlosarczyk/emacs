;;; icejam-complete-at-point.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Company completion framework configuration
;;; Code:
(require 'icejam-blocking)

(use-package yasnippet :ensure t :defer t
  :hook ((elpaca-after-init . yas-global-mode))
  :config
  (unbind-key "C-c & C-n" yas-minor-mode-map)
  (unbind-key "C-c & C-s" yas-minor-mode-map)
  (unbind-key "C-c & C-v" yas-minor-mode-map))

(use-package yasnippet-snippets :ensure t :after (yasnippet))


;; Corfu is the main engine for displaying suggestions.
(use-package corfu :ensure t :defer t
  :hook ((elpaca-after-init . global-corfu-mode)
         (global-corfu-mode . corfu-popupinfo-mode))
  :config
  ;; Go up to go the the last item on the list
  (setopt corfu-cycle t)

  ;; Show 20 corfu
  (setopt corfu-count 20)

  ;; Max width of the corfu frame
  (setopt corfu-max-width 120)

  (setopt corfu-right-margin-width 0.5)
  (setopt corfu-left-margin-width 0.5)
  (setopt corfu-bar-width 0.5)
  (setopt corfu-auto-delay 0.2)
  (setopt corfu-popupinfo-delay '(0.4 . 0.2))
  (setopt corfu-auto t)
  (setopt corfu-quit-no-match 'separator))

;; Allow corfu to work in terminal
(use-package corfu-terminal :ensure t :defer t
  :if (not (display-graphic-p))
  :hook ((elpaca-after-init . corfu-terminal-mode)))

;; These are actual completions
(use-package cape :ensure t :after corfu
  :config
  ;; Set default completion values:
  (set-default 'completion-at-point-functions
               (list (cape-capf-super #'lsp-completion-at-point
                                      #'yasnippet-capf)
                     #'cape-dabbrev
                     #'cape-file)))

(use-package yasnippet-capf :ensure t :after corfu
  :config (setopt yasnippet-capf-lookup-by 'name))

(use-package nerd-icons-corfu :ensure t
  :after corfu
  :config
  (declare-function nerd-icons-corfu-formatter 'nerd-icons-corfu)
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(provide 'icejam-complete-at-point)
;;; icejam-complete-at-point.el ends here
