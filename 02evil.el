(evil-mode 1)
(global-evil-leader-mode 1)

(require 'evil-leader)
;;;;;;;;; EVIL Leader ;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "w"  'delete-window
  ","  'previous-buffer
  "."  'next-buffer
  "k"  'kill-buffer-and-window
  "rb" 'revert-buffer) ; Reload current file from disk

(evil-leader/set-key "hs" 'split-window-below)
(evil-leader/set-key "vs" 'split-window-right)

(evil-leader/set-key
  "gk" 'windmove-up
  "gj" 'windmove-down
  "gl" 'windmove-right
  "gh" 'windmove-left)
