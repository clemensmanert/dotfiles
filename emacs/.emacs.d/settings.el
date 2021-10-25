;; This file contains all the settings, which belong to emacs and not
;; to one of its modes.
;; Author: Clemens Manert (Clemens@Manert.de)

;; Emacs window Title
(setq frame-title-format (concat "%b - Emacs " emacs-version))

;; make company mode support camel case
(setq company-dabbrev-downcase nil)

;; Visualize tabs, lines longer than 80 chars and trailing spaces.
(setq whitespace-style '(face tabs lines-tail trailing))

;; Show last 200 files in recent file list
(setq recentf-max-menu-items 200)

;; Use spaces instead of tabs while align-regexp
(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(setq langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-commandline.jar")

(setq backup-directory-alist `(("." . "~/.emacs_backups")))

;; Typescript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; robe on ruby
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

(setq compilation-ask-about-save nil) ;; automatically save (without asking) before compile

(eval-after-load 'company
  '(push 'company-robe company-backends))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; colorize output of compile buffer; prefents from printing escape sequences
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Do not open a new *compilation* if it is already open in another frame
(setq-default display-buffer-reuse-frames t)

(put 'flycheck-clang-args 'safe-local-variable (lambda (xx) t))


(setq gdb-show-main t) ;; show gdb many windows when invoking gdb

(defun buffer-only-keybinding (key command)
  (interactive
   "Set buffer only keybinding : \nCSet key %s buffer-locally to command: ")
  (let ((oldmap (current-local-map))
        (newmap (make-sparse-keymap)))
    (when oldmap
      (set-keymap-parent newmap oldmap))
    (define-key newmap key command)
    (use-local-map newmap)))
