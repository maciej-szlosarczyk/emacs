;;; pkg/persp.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Perspectives

;;; Code:
(use-package perspective
  :config (persp-mode)
  (unbind-key "C-x x" persp-mode-map)
  (unbind-key "C-x x C-l" persp-mode-map)
  (unbind-key "C-x x C-s" persp-mode-map)
  (unbind-key "C-x x A" persp-mode-map)
  (unbind-key "C-x x a" persp-mode-map)
  (unbind-key "C-x x b" persp-mode-map)
  (unbind-key "C-x x c" persp-mode-map)
  (unbind-key "C-x x i" persp-mode-map)
  (unbind-key "C-x x k" persp-mode-map)
  (unbind-key "C-x x n" persp-mode-map)
  (unbind-key "C-x x p" persp-mode-map)
  (unbind-key "C-x x r" persp-mode-map)
  (unbind-key "C-x x s" persp-mode-map)
  (unbind-key "C-x x <left>" persp-mode-map)
  (unbind-key "C-x x <right>" persp-mode-map)
  (unbind-key "C-x x C-x x" persp-mode-map))

(provide 'icejam-pkg-persp)
;;; persp.el ends here
