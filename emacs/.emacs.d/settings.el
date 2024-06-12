;; This file contains all the settings, which belong to emacs and not
;; to one of its modes.
;; Author: Clemens Manert (Clemens@Manert.de)

;; Emacs window Title
(setq frame-title-format (concat "%b - Emacs" emacs-version))

(add-to-list 'default-frame-alist
             '(font . "Iosevka Curly-14"))

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook (local-set-key (kbd "C-<return>") 'eglot-code-actions))

;; Visualize tabs, lines longer than 80 chars and trailing spaces.
(setq whitespace-style '(face tabs lines-tail trailing))

;; Show last 200 files in recent file list
(setq recentf-max-menu-items 200)

;; Use spaces instead of tabs while align-regexp
(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(setq backup-directory-alist `(("." . "~/.emacs_backups")))

;; robe on ruby
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

(setq compilation-ask-about-save nil) ;; automatically save (without asking) before compile

(eval-after-load 'company
  '(push 'company-robe company-backends))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

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

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
