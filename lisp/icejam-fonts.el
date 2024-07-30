;;; icejam-fonts.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot

;;; Commentary:

;; Set font stuff

;;; Code:

;; Set font face
;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun icejam/set-lsp-ui-font-hook ()
  "Reset LSP IO font to specified icejam-font and icejam-font-size."
  (setq lsp-ui-doc-frame-hook nil)
  (add-hook 'lsp-ui-doc-frame-hook
            (lambda (frame _w)
              (set-face-attribute
               'default frame :font
               (format "%s %d" icejam-font (- icejam-font-size 2))))))

(defun icejam/set-font (name size)
  "Set font to NAME and its SIZE to X pixels."
  (interactive "sNew font: \nnEnter size for %s: ")
  (setq icejam-font name)
  (setq icejam-font-size size)

  (set-face-attribute 'default nil :font (format "%s %d" name size))

  ;; Set completion and modeline font to be 1 pixel point smaller than
  ;; the general font
  ;; (set-face-attribute
  ;;  'markdown-code-face nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute
   'tooltip nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute
   'company-tooltip nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute
   'company-tooltip-annotation nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute
   'company-tooltip-mouse nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute
   'mode-line nil :font (format "%s %d" name (- size 1)))
  (set-face-attribute
   'mode-line-inactive nil :font (format "%s %d" name (- size 1)))

  ;; Call LSP-UI hook
  (icejam/set-lsp-ui-font-hook))

(defvar icejam-font "Iosevka Term")
;; (defvar icejam-font "Monoid")
;; (defvar icejam-font "Fira Mono")
;; (defvar icejam-font "Fira Code")
;; (defvar icejam-font "Red Hat Mono")
;; (defvar icejam-font "Agave Nerd Font Mono")
;; (defvar icejam-font "Input Mono Condensed")
;; (defvar icejam-font "SF Mono")
;; (defvar icejam-font "Monaco")
;; (defvar icejam-font "JetBrains Mono")
;; (defvar icejam-font "JuliaMono")
;; (defvar icejam-font "Rec Mono Semicasual")
;; (defvar icejam-font "Victor Mono")
;; (defvar icejam-font "IBM Plex Mono")
(defvar icejam-font-size 14)

(defun icejam/set-font-to-screen ()
  "Automatically set font size to suit the monitor."
  ;; If display is set to emulate FullHD resultion or less, make the font
  ;; smaller.
  (interactive)
  (cond ((eq (x-display-list) nil))
        ;; built-in screen
        ((>= 1050 (x-display-pixel-height))
         (icejam/set-font icejam-font icejam-font-size))

        ;; 4K screen on a Mac
        ((>= 1080 (x-display-pixel-height))
         (icejam/set-font icejam-font icejam-font-size))

        ;; Other screens
        ((>= 1120 (x-display-pixel-height))
         (icejam/set-font icejam-font icejam-font-size))

        ((>= 1440 (x-display-pixel-height))
         (icejam/set-font icejam-font (+ icejam-font-size 3)))

        ((>= 1920 (x-display-pixel-height))
         (icejam/set-font icejam-font icejam-font-size))

        ;; 4K screen on Windows or Linux
        ((>= 2160 (x-display-pixel-height))
         (icejam/set-font icejam-font (- icejam-font-size 3)))

        ;; Default
        (t (icejam/set-font icejam-font (- icejam-font-size 3)))))

;; Do it automatically on startup
(icejam/set-font-to-screen)

(defun icejam/set-font-size (size)
  "Set font to a specified SIZE."
  (interactive "nEnter size for font: ")
  (icejam/set-font icejam-font size))

(defun icejam/set-font-size-for-this-frame (new-size)
  "Set font NEW-SIZE for this frame only."
  (interactive "nEnter new size for font in this frame: ")
  (set-frame-font (format "%s %d" icejam-font new-size)))

;; Remove ugly black line
(set-face-attribute 'vertical-border nil :foreground
                    (face-attribute 'fringe :background))

;; Set fringe colors to default, so it does not bother you.
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))

(provide 'icejam-fonts)
;;; icejam-fonts.el ends here
