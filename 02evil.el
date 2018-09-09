(evil-mode 1)
(global-evil-leader-mode 1)

(require 'evil-leader)
;;;;;;;;; EVIL Leader ;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "w"  'delete-window ;; C-x 0
  ","  'previous-buffer ;; C-x left
  "."  'next-buffer ;; C-x right
  "k"  'kill-buffer-and-window ;; C-x 4 0
  "rb" 'revert-buffer) ;; S-u Reload current file from disk

(evil-leader/set-key "hs" 'split-window-below) ;; C-x 2
(evil-leader/set-key "vs" 'split-window-right) ;; C-x 3

(evil-leader/set-key
  "gk" 'windmove-up
  "gj" 'windmove-down
  "gl" 'windmove-right
  "gh" 'windmove-left)
