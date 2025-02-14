;; [adj] movement and editing for lisp

(provide 'maze-lisp)

(defun maze--cur-end ()
  (push-mark)
  (thing-at-point--end-of-sexp)
  (let ((cur (point)))
    (goto-char (mark))
    (pop-mark)
    cur))

(defun maze--hl (beg end &optional buffer)
  (let ((overlay (make-overlay beg end (or buffer (current-buffer)))))
    (overlay-put overlay 'face 'highlight)
    (setq maze-overlay overlay)
    overlay))

(defun maze--unhl ()
  (if maze-overlay
      (delete-overlay maze-overlay)))

(defun maze--update-hl (beg end)
  (if maze-overlay
      (move-overlay maze-overlay beg end)
    (maze--hl beg end)))

(defun maze-forward (n)
  (interactive "p")
  (goto-char (or (scan-sexps (point) 2) (buffer-end 1)))
  (thing-at-point--beginning-of-sexp)
  (maze--update-hl (point) (maze--cur-end)))

(defun maze-backward (n)
  (interactive "p")
  (let ((n (or n 1)))
    (backward-sexp n))
  (maze--update-hl (point) (maze--cur-end)))

(defun maze-inward (n)
  (interactive "p")
  (down-list n)
  (maze--update-hl (point) (maze--cur-end)))

(defun maze-outward (n)
  (interactive "p")
  (backward-up-list n)
  (maze--update-hl (point) (maze--cur-end)))

(defvar-keymap maze-mode-map
  (kbd "j") 'maze-forward
  (kbd "k") 'maze-backward
  (kbd "l") 'maze-inward
  (kbd "h") 'maze-outward)


(define-minor-mode maze-mode
                         "doc"
  :keymap maze-mode-map
  :init-value nil
  :after-hook (progn
                (setq-local parse-sexp-ignore-comments t)
                (setq-local maze-overlay nil)
                (font-lock-mode 1)))
