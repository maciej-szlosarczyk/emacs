;; icejam-base16-zenburn.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Original Authors:
;; Scheme: elnawe
;; Template: Kaleb Elwert <belak@coded.io>
;; Modification: Maciej Szlosarczyk <maciej@sosek.net>

;;; Code:

;; Modifications
;; 02 made darker by 5%   #606060 => #5b5b5b
;; 03 made lighter by 10% #6f6f6f => #898989
;; 04 made darker by 5%   #808080 => #7a7a7a
;; 0B made lighter by 10% #5f7f5f => #799979

(declare-function base16-theme-define "base16-theme" (theme-name theme-colors))

(defvar icejam-base16-zenburn-colors
  '(:base00 "#383838"
    :base01 "#404040"
    :base02 "#5b5b5b"
    :base03 "#898989"
    :base04 "#7a7a7a"
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
(deftheme icejam-base16-zenburn)

;; Add all the faces to the theme
(with-eval-after-load 'base16-theme
  (base16-theme-define 'icejam-base16-zenburn icejam-base16-zenburn-colors))

;; Mark the theme as provided
(provide-theme 'icejam-base16-zenburn)
(provide 'icejam-base16-zenburn)
;;; icejam-base16-zenburn.el ends here
