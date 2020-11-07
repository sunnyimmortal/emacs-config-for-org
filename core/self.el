;;toggle window
;;第一种
;(defun toggle-window-split ()
;  (interactive)
;  (if (= (count-windows) 2)
;      (let* ((this-win-buffer (window-buffer))
;             (next-win-buffer (window-buffer (next-window)))
;             (this-win-edges (window-edges (selected-window)))
;             (next-win-edges (window-edges (next-window)))
;             (this-win-2nd (not (and (<= (car this-win-edges)
;                                         (car next-win-edges))
;                                     (<= (cadr this-win-edges)
;                                         (cadr next-win-edges)))))
;             (splitter
;              (if (= (car this-win-edges)
;                     (car (window-edges (next-window))))
;                  'split-window-horizontally
;                'split-window-vertically)))
;        (delete-other-windows)
;        (let ((first-win (selected-window)))
;          (funcall splitter)
;          (if this-win-2nd (other-window 1))
;          (set-window-buffer (selected-window) this-win-buffer)
;          (set-window-buffer (next-window) next-win-buffer)
;          (select-window first-win)
;                    (if this-win-2nd (other-window 1))))))

;; from purcell init window.el
(defun split-window-horizontally-instead ()
  "Kill any other windows and re-split such that the current window is on the top half of the frame."
  (interactive)
  (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
    (delete-other-windows)
    (split-window-horizontally)
    (when other-buffer
          (set-window-buffer (next-window) other-buffer))))
(global-set-key (kbd "C-x w") 'split-window-horizontally-instead)

;;设置org-agenda在右
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;启动时显示org-mode
;;(add-hook 'after-init-hook 'org-agenda-list)
(org-agenda-list)








(provide 'self)
