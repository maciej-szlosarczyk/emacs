;; base16-not-harmonic-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)
;; Based on harmonic-dark theme by Jannik Seibert (https://github.com/janniks)
;;; Code:

(require 'base16-theme)

(defvar base16-not-harmonic-colors
  '(:base00 "#0b1c2c"
    :base01 "#223b54"
    :base02 "#2c3a47"
    :base03 "#627e99"
    :base04 "#aabcce"
    :base05 "#cbd6e2"
    :base06 "#e5ebf1"
    :base07 "#f7f9fb"
    :base08 "#bf8b56"
    :base09 "#bfbf56"
    :base0A "#8bbf56"
    :base0B "#56bf8b"
    :base0C "#568bbf"
    :base0D "#9b78bc"
    :base0E "#bf568b"
    :base0F "#bf5656")
  "All colors for Base16 Harmonic16 Dark are defined here.")

;; Define the theme
(deftheme base16-not-harmonic)

;; Add all the faces to the theme
(base16-theme-define 'base16-not-harmonic base16-not-harmonic-colors)

;; Customise things
(custom-theme-set-faces
 'base16-not-harmonic
 '(cursor ((t (:background "#568bbf"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#aabcce"))))
 '(mode-line ((t (:font "Hasklig 16"))))
 '(fringe ((t (:background "#2c3a47" :slant normal))))

 '(diff-refine-added ((t (:background "#56bf8b" :foreground "#2c3a47"))))
 '(diff-refine-removed ((t (:background "#bf5656" :foreground "#2c3a47"))))
 '(diff-refine-changed ((t (:background "#bfbf56" :foreground "#2c3a47"))))

 '(magit-diff-added ((t (:background "#56bf8b" :foreground "#2c3a47"))))
 '(magit-diff-added-highlight ((t (:background "#8bbf56" :foreground "#2c3a47"))))

 '(magit-diff-our ((t (:background "#bf5656" :foreground "#2c3a47"))))
 '(magit-diff-our-highlight ((t (:background "#bf568b" :foreground "#2c3a47"))))

 '(magit-diff-removed ((t (:background "#bf5656" :foreground "#2c3a47"))))
 '(magit-diff-removed-highlight ((t (:background "#bf568b" :foreground "#2c3a47")))))

;; Mark the theme as provided
(provide-theme 'base16-not-harmonic)

(provide 'base16-not-harmonic-theme)

;;; base16-not-harmonic-theme.el ends here
