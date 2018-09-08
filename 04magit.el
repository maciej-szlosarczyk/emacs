;; Magit
(evil-leader/set-key
  "gs"  'magit-status
  "gco" 'magit-checkout
  ;; TODO: Connect these two into one key
  "gb" 'magit-blame
  "gq" 'magit-blame-quit)

(require 'evil-magit)
