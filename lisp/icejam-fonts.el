;;; icejam-fonts.el --- summary -*- lexical-binding: t; -*-

;; Author: Maciej Szlosarczyk
;; Maintainer: Maciej Szlosarczyk
;; Version: 0.1-snapshot
;;; Commentary:

;; Set font stuff

;;; Code:
;; (defconst icejam-font "Monoid"
;; (defconst icejam-font "Fira Mono"
;; (defconst icejam-font "Fira Code"
;; (defconst icejam-font "Red Hat Mono"
;; (defconst icejam-font "Agave Nerd Font Mono"
;; (defconst icejam-font "Input Mono Condensed"
;; (defconst icejam-font "SF Mono"
;; (defconst icejam-font "Monaco"
;; (defconst icejam-font "JetBrains Mono" "Default font.")
;; (defconst icejam-font "JuliaMono"
;; (defconst icejam-font "Rec Mono Semicasual"
;; (defconst icejam-font "IBM Plex Mono"
;; (defconst icejam-font "Berkeley Mono Trial"
;; (defconst icejam-font "Inconsolata"
;; (defconst icejam-font "Victor Mono Medium" "Default font.")
;; (defconst icejam-font "Iosevka Term" "Default font.")

(defconst icejam-default-font-family "Iosevka Term" "Default font.")
(defconst icejam-variable-font-family "Lexica Ultralegible" "Variable pitch font.")
(defconst icejam-markdown-font-family "Iosevka Comfy Motion"
  "Font used to render code blocks in markdown.
It is different than default font to keep it visually distinct.")

;; Require dash functions to be included:
(declare-function -> "dash.el")

(defconst icejam-font-height 14
  "Default height of then font.
It is used to calculated the height in relation to the screen
in `icejam-set-font-to-screen`.")

(defcustom icejam-mut-default-font-family
  icejam-default-font-family
  "Current font, defaults to the one loaded in the beginning."
  :type 'string
  :group 'icejam)
(defcustom icejam-mut-variable-font-family
  icejam-default-font-family
  "Current variable-pitch font.  Defaults to `icejam-variable-font-family`."
  :type 'string
  :group 'icejam)
(defcustom icejam-mut-markdown-font-family
  icejam-markdown-font-family
  "Current markdown font family, defaults to the one loaded in the beginning."
  :type 'string
  :group 'icejam)
(defcustom icejam-mut-font-height
  icejam-font-height
  "Current font height."
  :type 'integer
  :group 'icejam)

;;;;;;;;;;;;;;;;;;;;;; Font configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; First, let's silence a warning about free variables
(defvar lsp-ui-doc-frame-hook)

(defun icejam-set-lsp-ui-font-hook ()
  "Reset LSP IO font to specified `icejam-font` and `icejam-font-height`."
  (setopt lsp-ui-doc-frame-hook nil)
  (add-hook 'lsp-ui-doc-frame-hook
            (lambda (frame _w)
              (set-face-attribute 'default frame
                                  :family icejam-mut-default-font-family
                                  :height (-> icejam-mut-font-height
                                              (- 2)
                                              (* 10))))))

(defun icejam-set-font (family height)
  "Set font to FAMILY and its HEIGHT to X.

Not all faces will be set to this value.  Some of them look better with being
slightly smaller than the default face, by 1 point.  Those are: `tooltip'.

Modeline faces (`mode-line' and `mode-line-inactive') look better if they are
two points smaller."
  (interactive "sNew font: \nnEnter height for %s: ")
  (setopt icejam-mut-default-font-family family)
  (setopt icejam-mut-font-height height)
  (setopt icejam-mut-variable-font-family icejam-variable-font-family)

  ;; Set default font.
  (set-face-attribute 'default nil
                      :family family
                      :height (-> height
                                  (* 10)))

  ;; Set variable-pitch font
  (set-face-attribute 'variable-pitch nil
                      :family icejam-mut-variable-font-family
                      :height (-> height
                                  (* 10)))

  ;; Some font faces look better when they are 1 point smaller.
  (dolist (face '(tooltip))
    (set-face-attribute face nil :height (-> height
                                             (- 1)
                                             (* 10))))

  ;; And some, mainly in modeline with 2 points.
  (dolist (face '(mode-line
                  mode-line-inactive))
    (set-face-attribute face nil :height (-> height
                                             (- 2)
                                             (* 10))))

  ;; Call LSP-UI hook
  (icejam-set-lsp-ui-font-hook))

(defun icejam-set-font-to-screen ()
  "Automatically set font height to suit the monitor."
  (interactive)

  ;; Only do anything if there's a display at all.
  (if (x-display-list)
      (let ((pixel-height (x-display-pixel-height)))
        (cond
         ;; MacBook 14" built-in screen.
         ((>= 1080 pixel-height)
          (icejam-set-font icejam-default-font-family icejam-font-height))

         ;; LG 27" screen connected to a MacBook.
         ((>= 1440 pixel-height)
          (icejam-set-font icejam-default-font-family (+ icejam-font-height 3)))

         ;; 4K screen on Windows or Linux
         ((>= 2160 pixel-height)
          (icejam-set-font icejam-default-font-family (- icejam-font-height 3)))))))

;; Run the above function once, after elpaca finishes all downloads.
(add-hook 'elpaca-after-init-hook 'icejam-set-font-to-screen)

(defun icejam-set-font-height (height)
  "Set font to a specified HEIGHT."
  (interactive "nEnter height for font: ")
  (icejam-set-font icejam-mut-default-font-family height))

(defun icejam-set-font-height-for-this-frame (new-height)
  "Set font NEW-HEIGHT for this frame only."
  (interactive "nEnter new height for font in this frame: ")
  (set-frame-font (format "%s %d" icejam-mut-default-font-family new-height)))

(provide 'icejam-fonts)
;;; icejam-fonts.el ends here
