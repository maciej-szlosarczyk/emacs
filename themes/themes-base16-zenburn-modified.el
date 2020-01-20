;; base16-zenburn-modified-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Original Authors:
;; Scheme: elnawe
;; Template: Kaleb Elwert <belak@coded.io>
;; Modification: Maciej Szlosarczyk <maciej@sosek.net>

;;; Code:

;; Modifications
;; 03 made lighter by 10% #6f6f6f => #898989
;; 0B made lighter by 10% #5f7f5f => #799979

(require 'base16-theme)

(defvar base16-zenburn-modified-colors
  '(:base00 "#383838"
    :base01 "#404040"
    :base02 "#606060"
    :base03 "#898989"
    :base04 "#808080"
    :base05 "#dcdccc"
    :base06 "#c0c0c0"
    :base07 "#ffffff"
    :base08 "#dca3a3"
    :base09 "#dfaf8f"
    :base0A "#e0cf9f"
    :base0B "#799979"
    :base0C "#93e0e3"
    :base0D "#7cb8bb"
    :base0E "#dc8cc3"
    :base0F "#000000")
  "All colors for Base16 Zenburn-Modified are defined here.")

;; Define the theme
(deftheme base16-zenburn-modified)

;; Add all the faces to the theme
(base16-theme-define 'base16-zenburn-modified base16-zenburn-modified-colors)

;; Mark the theme as provided
(provide-theme 'base16-zenburn-modified)

(provide 'base16-zenburn-modified-theme)

;;; base16-zenburn-modified-theme.el ends here
