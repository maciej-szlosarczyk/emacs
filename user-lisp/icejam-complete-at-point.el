;;; icejam-complete-at-point.el -- summary -*- lexical-binding: t; -*-
;;; Commentary:
;;; Completion framework configuration
;;; Code:
(eval-when-compile
  (defvar corfu-terminal-mode 'corfu-terminal)
  (declare-function cape-dabbrev 'cape)
  (declare-function cape-file 'cape)
  (declare-function cape-keyword 'cape)
  (declare-function cape-elisp-symbol 'cape)
  (declare-function cape-capf-prefix-length 'cape)
  (declare-function cape-capf-super 'cape)
  (declare-function yasnippet-capf 'yasnippet)
  (declare-function nerd-icons-corfu-formatter 'nerd-icons-corfu)
  (declare-function eglot-completion-at-point 'eglot))

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
  (setopt corfu-cycle t
          corfu-count 20      ;; Show 20 completion candidates
          corfu-max-width 100 ;; Max width of the corfu frame
          corfu-right-margin-width 0.5
          corfu-left-margin-width 0.5
          corfu-bar-width 0.5
          ;; Do not insert when you type a word that happens to be a
          ;; completion candidate. A typical example is `format`, which
          ;; is a yas snippet.
          corfu-on-exact-match 'quit
          corfu-quit-at-boundary t
          corfu-popupinfo-delay '(0.4 . 0.2)
          corfu-auto t
          corfu-auto-delay 0.2
          corfu-quit-no-match 'separator

          ;; Invoke completion with tab when needed.
          tab-always-indent 'complete))

;; Allow corfu to work in terminal
(use-package corfu-terminal :ensure t :defer t
  :if (not (display-graphic-p))
  :hook ((elpaca-after-init . corfu-terminal-mode)))

;; These are actual completions
(use-package cape :ensure t :after corfu
  :config
  ;; Set default completion values:
  (set-default 'completion-at-point-functions
               (list (cape-capf-super #'cape-dabbrev #'yasnippet-capf)
                     #'cape-file
                     #'cape-keyword)))

(defun icejam-set-no-eglot-capfs ()
  "Set `completion-at-point-function` to non-LSP list."
  (setq-local completion-at-point-functions
              (list (cape-capf-super #'cape-dabbrev #'yasnippet-capf)
                    #'cape-file
                    #'cape-keyword)))

(defun icejam-set-eglot-capfs ()
  "Set `completion-at-point-function` to list where LSP is supported."
  (setq-local completion-at-point-functions
              (list
                (cape-capf-super #'yasnippet-capf #'eglot-completion-at-point)
                #'cape-dabbrev
                #'cape-file)))

(defun icejam-set-elisp-capfs ()
  "Set `completion-at-point-function` to what is useful in Elisp."
  (setq-local completion-at-point-functions
              (list (cape-capf-super #'elisp-completion-at-point
                                      #'yasnippet-capf)
                     #'cape-dabbrev
                     #'cape-file
                     #'cape-elisp-symbol)))

(use-package yasnippet-capf :ensure t :after corfu :defer t
  :config
  (setopt yasnippet-capf-lookup-by 'name))

(use-package nerd-icons-corfu :ensure t :after corfu :defer 5
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(provide 'icejam-complete-at-point)
;;; icejam-complete-at-point.el ends here
