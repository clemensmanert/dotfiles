;; Contains the global key bindings used in my emacs configuration
;; Author: Clemens@Manert.de

;; Lisp
(global-set-key (kbd "C-x e") 'eval-buffer)

;; Switching color-theme
(global-set-key [f8] 'my-theme-cycle-dark)
(global-set-key [f9] 'my-theme-cycle-light)

;; Jump to next section
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)
 
;; auto complete current word
;;(global-set-key [C-return] 'auto-complete)
(global-set-key [C-return] 'company-complete)

;; Window control
;; Create and remove windows.
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)

;; Window selection
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)
(global-set-key (kbd "C-M-<up>") 'windmove-up)
(global-set-key (kbd "C-M-<down>") 'windmove-down)
(global-set-key (kbd "C-M-<right>") 'windmove-right)
(global-set-key (kbd "C-M-<left>") 'windmove-left)

;; Multiple cursor 
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; List recent files
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Fullscreen
(global-set-key [f11] 'toggle-fullscreen)

;; Visual regex
(define-key global-map (kbd "C-M-%") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;; Ispell dictionaries
(global-set-key [f6] 'cycle-ispell-languages)

;; unset
(global-unset-key (kbd "C-z"))
