;;; fonts.el --- summary

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Set font stuff

;;; Code:

;; Set font face
;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-font (name size)
  "Set font to NAME and its SIZE to X pixels."
  (interactive "sNew font: \nnEnter size for font %s: ")
  (set-face-attribute 'default nil :font (format "%s %d" name size))
  ;; Set modeline font to be 1 pixel point smaller than the general font
  (set-face-attribute 'mode-line nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute 'mode-line-inactive nil :font
                      (format "%s %d" name (- size 1))))

;; (defconst +custom-font "Iosevka Term")
;; (defconst +custom-font "JetBrains Mono")
(defconst +custom-font "IBM Plex Mono")

(defun set-font-to-screen ()
  "Automatically set font size to suit the monitor."
  (interactive)
  ;; If display is set to emulate FullHD resultion or less, make the font
  ;; smaller.
  (cond ((eq (x-display-list) nil)) ()
        ;; built-in screen
        ((>= 1050 (x-display-pixel-height)) (set-font +custom-font 14))
        ;; 4K screen
        ((>= 1080 (x-display-pixel-height)) (set-font +custom-font 14))
        ((>= 1120 (x-display-pixel-height)) (set-font +custom-font 14))
        ((>= 1440 (x-display-pixel-height)) (set-font +custom-font 16))
        ;; 4K screen on Windows
        ((>= 2160 (x-display-pixel-height)) (set-font +custom-font 20))
        (t (set-font +custom-font 16))))

;; Do it automatically on startup
(set-font-to-screen)

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))

(provide '+custom-pkg-fonts)
;;; fonts.el ends here
