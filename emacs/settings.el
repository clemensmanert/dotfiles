;; This file contains all the settings, which belong to emacs and not
;; to one of its modes.
;; Author: Clemens Manert (Clemens@Manert.de)

;; Emacs window Title
(setq frame-title-format (concat "%b - Emacs " emacs-version))

;; make company mode support camel case
(setq company-dabbrev-downcase nil)

(powerline-default-theme)

;; Visualize tabs, lines longer than 80 chars and trailing spaces.
(setq whitespace-style '(face tabs lines-tail trailing))

