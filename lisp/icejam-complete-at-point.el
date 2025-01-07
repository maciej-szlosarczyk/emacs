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

(use-package corfu :ensure t :defer t
  :hook ((elpaca-after-init . global-corfu-mode)
         (global-corfu-mode . corfu-popupinfo-mode))
  :config
  (setopt corfu-auto-delay 0.2)
  (setopt corfu-popupinfo-delay '(0.4 . 0.2))
  (setopt corfu-auto t)
  (setopt corfu-quit-no-match 'separator))

(use-package corfu-terminal :ensure t :defer t
  :unless (display-graphic-p)
  :hook ((elpaca-after-init . corfu-terminal-mode)))

(use-package cape :ensure t :after corfu
  :commands (cape-dabbrev cape-file cape-elisp-symbol)
  :init
  (add-hook 'prog-mode-hook
            (lambda ()
              (progn
                (add-hook 'completion-at-point-functions #'cape-dabbrev)
                (add-hook 'completion-at-point-functions #'cape-file)
                (add-hook 'completion-at-point-functions #'cape-elisp-symbol)))))

(use-package yasnippet-capf :ensure t
  :after corfu
  :commands (yasnippet-capf)
  :config (setopt yasnippet-capf-lookup-by 'name)
  :init
  (add-hook 'prog-mode-hook
            (lambda () (add-hook 'completion-at-point-functions #'yasnippet-capf))))

(use-package kind-icon
  :ensure t
  :after corfu
  :config
  (declare-function kind-icon-margin-formatter kind-icon)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'icejam-complete-at-point)
;;; icejam-complete-at-point.el ends here
