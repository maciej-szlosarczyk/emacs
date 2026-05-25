;; icejam-base16-catppuccin-latte.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: https://github.com/catppuccin/catppuccin
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

;; Modifications:
;; 03 darker by 8% #bcc0cc => #aaafbe

(eval-when-compile
  (declare-function base16-theme-define "base16-theme" (theme-name theme-colors)))

(defvar icejam-base16-catppuccin-latte-theme-colors
  '(:base00 "#eff1f5"
            :base01 "#e6e9ef"
            :base02 "#ccd0da"
            :base03 "#aaafbe"
            :base04 "#acb0be"
            :base05 "#4c4f69"
            :base06 "#dc8a78"
            :base07 "#7287fd"
            :base08 "#d20f39"
            :base09 "#fe640b"
            :base0A "#df8e1d"
            :base0B "#40a02b"
            :base0C "#179299"
            :base0D "#1e66f5"
            :base0E "#8839ef"
            :base0F "#dd7878")
  "All colors for Base16 Catppuccin Latte are defined here.")

;; Define the theme
(deftheme icejam-base16-catppuccin-latte)

;; Add all the faces to the theme
(with-eval-after-load 'base16-theme
  (base16-theme-define 'icejam-base16-catppuccin-latte
                       icejam-base16-catppuccin-latte-theme-colors))

;; Mark the theme as provided
(provide-theme 'icejam-base16-catppuccin-latte)
(provide 'icejam-base16-catppuccin-latte)

;;; icejam-base16-catppuccin-latte.el ends here
