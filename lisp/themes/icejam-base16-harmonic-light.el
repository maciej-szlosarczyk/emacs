;;; base16-harmonic-light-modified-theme.el --- summary
;;; Commentary:

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Code:

(use-package base16-theme :straight t :defer t)

(defvar base16-harmonic-light-modified-colors
  '(:base00 "#f7f9fb"
    :base01 "#e5ebf1"
    :base02 "#cbd6e2"
    :base03 "#92a9c0"
    :base04 "#627e99"
    :base05 "#405c79"
    :base06 "#223b54"
    :base07 "#0b1c2c"
    :base08 "#bf8b56"
    :base09 "#bfbf56"
    :base0A "#8bbf56"
    :base0B "#56bf8b"
    :base0C "#568bbf"
    :base0D "#8b56bf"
    :base0E "#bf568b"
    :base0F "#bf5656")
  "All colors for Base16 Harmonic Light Modified are defined here.")

;; Define the theme
(deftheme base16-harmonic-light-modified)

;; Add all the faces to the theme
(base16-theme-define 'base16-harmonic-light-modified base16-harmonic-light-modified-colors)

;; Mark the theme as provided
(provide-theme 'base16-harmonic-light-modified)
(provide 'icejam-base16-harmonic-light)
;;; icejam-base16-harmonic-light.el ends here
