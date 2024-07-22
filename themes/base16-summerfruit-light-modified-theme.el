;;; base16-summerfruit-light-modified-theme.el --- summary
;;; Commentary:

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Code:

(use-package base16-theme :straight t :defer t)

(defvar base16-summerfruit-light-modified-colors
  '(:base00 "#fdfcfa"
    :base01 "#e0e0e0"
    :base02 "#d0d0d0"
    :base03 "#b0b0b0"
    :base04 "#000000"
    :base05 "#101010"
    :base06 "#151515"
    :base07 "#202020"
    :base08 "#ff0086"
    :base09 "#fd8900"
    :base0A "#aba800"
    :base0B "#00c918"
    :base0C "#1faaaa"
    :base0D "#3777e6"
    :base0E "#ad00a1"
    :base0F "#cc6633")
  "All colors for Base16 Summerfruit Light are defined here.")

;; Define the theme
(deftheme base16-summerfruit-light-modified)

;; Add all the faces to the theme
(base16-theme-define 'base16-summerfruit-light-modified base16-summerfruit-light-modified-colors)

;; Mark the theme as provided
(provide-theme 'base16-summerfruit-light-modified)
(provide 'themes/base16-summerfruit-light-modified-theme)
;;; base16-summerfruit-light-modified-theme.el ends here
