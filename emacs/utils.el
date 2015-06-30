;; Some helper functions (such as toggle xy), which help to access
;; existing functions.
;; Author: Clemens Manert (Clemens@Manert.de)

;; Toggles the fullscreen mode.
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

;; Redraw window after entering the fullscreen mode.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

;; Cycling between the spellchecker ispell languages
(let ((langs '("de-neu" "en_GB")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))
(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)
    (flyspell-mode 1) (message (concat "Spellcheck switched to " lang))))

;; Turns the minimap on and off.
(let ((minimap-modes '("minimap-kill" "minimap-create")))
  (setq minimap-modes-ring (make-ring (length minimap-modes)))
  (dolist (elem minimap-modes) (ring-insert minimap-modes-ring elem)))
(defun minimap-toggle()
  (interactive)
  (let ((minimap-mode (ring-ref minimap-modes-ring -1)))
    (ring-insert minimap-modes-ring minimap-mode)
    (eval minimap-mode))
  )

