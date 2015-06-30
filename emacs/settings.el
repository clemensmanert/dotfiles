;; This file contains all the settings, which belong to emacs and not
;; to one of its modes.
;; Author: Clemens Manert (Clemens@Manert.de)

;; store backups here.
(setq backup-directory-alist '(("." . "~/backups/emacs"))) 

;; Emacs window Title
(setq frame-title-format (concat "%b - Emacs " emacs-version))

;; hide the menu bar
(menu-bar-mode 0)

;; hide the tool bar 
(tool-bar-mode 0)

;; hide scrollbars
(scroll-bar-mode 0) 

;; Set default ispell dictionatry
(ispell-change-dictionary "deutsch")

;; Colorize the tail for the cursor
(setq highlight-tail-posterior-type 'const)
(setq highlight-tail-colors '(
                              ("#0000a4" . 0)
                              ("#0000cc" . 4)
                              ("#ef2929" . 10)))
(setq highlight-tail-steps 10                                 
       highlight-tail-timer 0.1)

(highlight-tail-reload)

;; Shows the powerline in the default theme
(powerline-default-theme)

;; make company mode support camel case
(setq company-dabbrev-downcase nil)
