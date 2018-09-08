(add-hook 'elixir-mode 'alchemist-mode)
(add-hook 'elixir-mode 'ruby-end-mode)

(eval-after-load 'company
  '(push 'alchemist-company company-backends))
