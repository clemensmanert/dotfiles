;;; Contains the global key bindings used in my emacs configuration.
;;; Author: Clemens@Manert.de


;; Lisp
(global-set-key (kbd "C-x e") 'eval-buffer)

 ;; auto complete current word
(global-set-key [C-return] 'company-complete)
(global-set-key (kbd "C-c c") 'company-complete)
(global-set-key (kbd "C-c z") 'company-yasnippet)
(global-set-key (kbd "C-c y") 'company-yasnippet)

;; Window control
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)

;; Window selection
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-M-<up>") 'windmove-up)
(global-set-key (kbd "C-M-<down>") 'windmove-down)
(global-set-key (kbd "C-M-<right>") 'windmove-right)
(global-set-key (kbd "C-M-<left>") 'windmove-left)

;; Buffer selection
(global-set-key (kbd "C-<tab>") 'switch-to-next-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'switch-to-prev-buffer)
;; Multiple cursor
(global-set-key (kbd "C-<") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Fullscreen
(global-set-key [f11] 'toggle-fullscreen)

;; Visual regex
(define-key global-map (kbd "C-M-%") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;; unset
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-.") 'find-tag)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "<f6>") 'helm-themes)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-c f") 'helm-locate)

(global-set-key (kbd "C-s") 'helm-occur)

(global-set-key (kbd "C-x C-g") 'helm-imenu)
(global-set-key (kbd "M-RET") 'helm-company)

(global-set-key (kbd "C-c s") 'dired-sidebar-toggle-with-current-directory)

(global-set-key (kbd "C-#") 'smart-comment-region)
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-c c") 'recompile)
(global-set-key (kbd "M-.") 'semantic-ia-fast-jump)

(global-set-key (kbd "M-$") 'helm-flyspell-correct)

(global-set-key (kbd "C-c h") 'pop-tag-mark)

(global-set-key (kbd "C-c d") 'ff-find-other-file)

(global-set-key (kbd "C-c C-f") 'project-find-file)

(global-set-key (kbd "S-<backspace>") 'goto-last-change)

(global-set-key (kbd "M-p") 'helm-imenu-in-all-buffers)
