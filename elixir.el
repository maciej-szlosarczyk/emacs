; Special language package
(require 'alchemist)

; Hooks
(add-hook 'elixir-mode-hook
          (alchemist-mode))

(add-hook 'elixir-mode-hook
          'flycheck-mode)

(add-hook 'elixir-mode-hook
          'ruby-end-mode)
