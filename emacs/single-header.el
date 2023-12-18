(defvar single-header--current-header-buffer nil "Read the name")

(defvar single-header-format '(make-header-info-string) "evaluated to fill the header")

(defface single-header '((default . (:background "#000000" :family "Source Code Pro"))) "Face for top line")

(require 'battery)
(defun with-face (str &rest face-plist)
  (add-face-text-property 0 (length str) face-plist t str)
  str)

;; disable normal emms-state and move it to the header
;; (require 'emms-state)
;; (setq single-header-emms-state-format-string
;;       '(emms-state
;;         (" " emms-state
;;          (emms-state-current-playing-time
;;           (" "
;;            (:propertize emms-state-current-playing-time
;;                         face emms-state-current-playing-time)))
;;          (emms-state-total-playing-time
;;           ("("
;;            (:propertize emms-state-total-playing-time
;;                         face emms-state-total-playing-time)
;;            ")"))
;;          emms-mode-line-string)))
;; (setq emms-state-mode-line-string "")

(defun make-header-info-string ()
  "generates the mode line string that contains all the info to the right"
  (let ((win (when (buffer-live-p single-header--current-header-buffer)
               (get-buffer-window single-header--current-header-buffer)))
        (str (concat
              (format-time-string "%a, %b %+4Y-%0m-%0d  ")
              (with-face (format-time-string "%R  ")
                         :weight 'bold)
              (with-face (format "<%03.2f>  " (car (load-average 1)))
                         :foreground "#da70d6")
              (with-face (let* ((mi (memory-info))
                                (tm (float (car mi)))
                                (fm (float (car (cdr mi))))
                                (ts (float (car (cdr (cdr mi)))))
                                (fs (float (car (cdr (cdr (cdr mi)))))))
                           (format "{%.2f %.2f}  " (- 1 (/ fm tm)) (- 1 (/ fs ts))))
                         :foreground "#00ced1")
              (with-face (battery-format "[%b%p%%]  " (and battery-status-function (funcall battery-status-function)))
                         :weight 'bold)
              ;; (format-mode-line single-header-emms-state-format-string)
              )))
    (setq str (concat str
                      (cond (win (make-string
                                  (- (window-max-chars-per-line win 'single-header) (length str)) ? ))
                            (t ""))
                      ))
    (with-face str 'single-header)))


(setq global-mode-string '("" (:eval (concat (with-face (format " [%s]  " default-directory)
                                                        :weight 'bold
                                                        :foreground "green2")))))

(defun single-header-init-buffer (buf)
  (with-current-buffer buf
    (insert "header test")
    (jit-lock-mode nil)
    (font-lock-mode -1)
    (buffer-disable-undo)
    (setq-local mode-line-format nil)
    (setq-local header-line-format nil)
    (setq-local cursor-type nil)
    (setq-local cursor-in-non-selected-windows nil)
    (setq-local overflow-newline-into-fringe nil)
    (setq-local word-wrap nil)
    (setq-local show-trailing-whitespace nil)))

(defun single-header-init-window (win)
  (with-selected-window win
    (set-window-dedicated-p win t)
    (set-window-parameter win 'no-other-window t)
    (set-window-parameter win 'no-delete-other-windows t)
    (set-window-margins win 0 0)
    (set-window-fringes win 0 0)
    (set-window-scroll-bars win 0 nil 0 nil)
    (setq-local window-min-height 1)
    (setq-local window-safe-min-height 1)
    (let
        (window-size-fixed)
      (fit-window-to-buffer win 1))
    (setq-local window-size-fixed t)
    (when
        (fboundp 'window-preserve-size)
      (window-preserve-size win nil t))))

(defun single-header-show (buf)
  "show / make a header"
  (if (buffer-live-p buf)
      (let ((win (display-buffer-in-side-window buf '((side . top)
                                                  (slot . -100)))))
        (single-header-init-window win))
    (single-header-make)))

(defun single-header-make ()
  "create the fake header line"
  (interactive)
  (unless (buffer-live-p single-header--current-header-buffer)
    (let ((buf (generate-new-buffer "*header*")))
      (single-header-init-buffer buf)
      (setq single-header--current-header-buffer buf)
      (single-header-show buf))))

(defun single-header-delete ()
  "remove an existing header buffer"
  (interactive)
  (when (buffer-live-p single-header--current-header-buffer)
    (kill-buffer single-header--current-header-buffer)))

(defun single-header-update ()
  "update the contents of the header line according to `single-header-format'"
  (when (buffer-live-p single-header--current-header-buffer)
    (with-current-buffer single-header--current-header-buffer
      (erase-buffer)
      (insert (eval single-header-format)))))

(add-hook 'after-make-frame-functions (lambda (frame)
                                        (with-selected-frame frame
                                       (single-header-show single-header--current-header-buffer))))

;; do init frame seperately
(single-header-show single-header--current-header-buffer)
(run-with-timer 0 1 'single-header-update)

