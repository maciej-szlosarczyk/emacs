;;; base16-modus-operandi-tinded.el --- summary
;;; Commentary:

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Code:

(use-package icejam-themes :ensure nil)

(defvar base16-modus-operandi-tinted-colors
  '(:base00 "#fbf7f0"
    :base01 "#efe9dd"
    :base02 "#c9b9b0"
    :base03 "#595959"
    :base04 "#595959"
    :base05 "#000000"
    :base06 "#193668"
    :base07 "#193668"
    :base08 "#a60000"
    :base09 "#006300"
    :base0A "#006300"
    :base0B "#0031a9"
    :base0C "#721045"
    :base0D "#00598b"
    :base0E "#731c52"
    :base0F "#80601f")
  "All colors for Base16 Modus Operandi are defined here.")

;; Define the theme
(deftheme base16-modus-operandi-tinted)

;; Add all the faces to the theme
(declare-function base16-theme-define 'base16-theme)
(base16-theme-define 'base16-modus-operandi-tinted base16-modus-operandi-tinted-colors)

;; Mark the theme as provided
(provide-theme 'base16-modus-operandi-tinted)
(provide 'icejam-base16-modus-operandi-tinted)
;;; icejam-base16-modus-operandi-tinted.el ends here
