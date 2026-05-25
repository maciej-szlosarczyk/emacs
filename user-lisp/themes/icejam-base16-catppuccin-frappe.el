;; icejam-base16-catppuccin-frappe.el -- A base16 colorscheme  -*- lexical-binding: t; -*-

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: https://github.com/catppuccin/catppuccin
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(declare-function base16-theme-define "base16-theme" (theme-name theme-colors))

(defvar icejam-base16-catppuccin-frappe-theme-colors
  '(:base00 "#303446"
    :base01 "#292c3c"
    :base02 "#414559"
    :base03 "#5f667f"
    :base04 "#626880"
    :base05 "#c6d0f5"
    :base06 "#f2d5cf"
    :base07 "#babbf1"
    :base08 "#e78284"
    :base09 "#ef9f76"
    :base0A "#e5c890"
    :base0B "#a6d189"
    :base0C "#81c8be"
    :base0D "#8caaee"
    :base0E "#ca9ee6"
    :base0F "#eebebe")
  "All colors for Base16 Catppuccin Frappe are defined here.")

;; Define the theme
(deftheme icejam-base16-catppuccin-frappe)

(with-eval-after-load 'base16-theme
  (base16-theme-define 'icejam-base16-catppuccin-frappe
                       icejam-base16-catppuccin-frappe-theme-colors))

;; Add all the faces to the theme
(base16-theme-define 'icejam-base16-catppuccin-frappe
                     icejam-base16-catppuccin-frappe-theme-colors)

;; Mark the theme as provided
(provide-theme 'icejam-base16-catppuccin-frappe)
(provide 'icejam-base16-catppuccin-frappe)
;;; icejam-base16-catppuccin-frappe.el ends here
