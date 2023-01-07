;;; -*- lexical-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tmu-custom))
 '(custom-safe-themes
   '("3d4e3644e237a95683daa73e397c4c0d1ae06bbaaf8040104232591a28bc1315" "12a07bc38295e4b06a8965db261f51ea7ea61fbf91b3ef41298bbb549d1d9403" default))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; stuff I will always want
(electric-pair-mode 1)
(global-hl-line-mode 1)

;; common hooks
(add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'prog-mode-hook (lambda ()
			    (hs-minor-mode 1)))

;; nice startup
(require 'iimage)
(setq inhibit-startup-screen t)
(setq initial-scratch-message (concat (propertize ";; " 'invisible t)
      "</home/tmu/.emacs.d/splashLaputa.png>
;; scratch for lisp evaluation and unsaved text

"))
(add-hook 'emacs-startup-hook (lambda ()
				(with-current-buffer "*scratch*"
				  (iimage-mode 1))))

;; transparancy
(add-to-list 'default-frame-alist '(alpha-background . 90)) ; For all new frames 
(defun toggle-frame-transparency ()
  "Toggle transparency."
  (interactive)
  (let ((alpha-transparency 90))
    (if (eq alpha-transparency (frame-parameter nil 'alpha-background))
	(set-frame-parameter nil 'alpha-background 100)
      (set-frame-parameter nil 'alpha-background alpha-transparency))))

;; mode line stuff
(require 'battery)
(defun with-face (str &rest face-plist)
  (propertize str 'face face-plist))
(defun make-mode-line-info-string ()
  "generates the mode line string that contains all the info to the right"
  (concat (format-time-string "%a, %b %+4Y-%0m-%0d  ")
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
	  (with-face (battery-format "[%b%p%%%%]  " (and battery-status-function (funcall battery-status-function)))
		     :weight 'bold)))
(setq global-mode-string '("" (:eval (make-mode-line-info-string))))

;; custom func keybinds
(global-unset-key (kbd "M-w"))
(global-set-key (kbd "M-w") 'copy-region-as-kill) ;;make copying not flash cursor
(defun zap-whitespace ()
  "zaps the whitespace around the point in both directions"
  (interactive)
  (push-mark)
  (skip-chars-backward " \t\n")
  (push-mark)
  (skip-chars-forward " \t\n")
  (delete-region (mark) (point))
  (pop-mark)
  (goto-char (mark))
  (pop-mark))
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "M-z") 'zap-whitespace)
(defun wrap-sexp (&optional arg)
  "Wraps the following sexp in a pair of parens and places inside the new pair, with prefix arg do the same backwards, pushing the mark"
  (interactive "P")
  (message "%s" arg)
  (if arg
      (progn
	(push-mark)
	(insert-pair -1 ?\( ?\)))
    (insert-pair 1 ?\( ?\))))
(global-set-key (kbd "C-M-z") 'wrap-sexp)

;;move buffers between windows in a convient way
(defun swap-buffer ()
  "Cycles the assignment of buffers to windows"
  (interactive)
  (cond ((one-window-p) (display-buffer (other-buffer)))
        ((let* ((buffer-a (current-buffer))
                (window-b (cadr (window-list)))
                (buffer-b (window-buffer window-b)))
           (set-window-buffer window-b buffer-a)
           (switch-to-buffer buffer-b)
           (other-window 1)))))
;;replace shrink window
(global-unset-key (kbd "C-x -"))
(global-set-key (kbd "C-x -") 'swap-buffer)

;; quick window switching
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-W") 'switch-to-buffer)

;; save/restore window config
(setq current-saved-layout ?0)
(seq-do (lambda (number)
	  (let* ((string (int-to-string number))
		 (char (string-to-char string))
		 (key (kbd (concat "M-" string))))
	    (global-unset-key key)
	    (global-set-key key (lambda ()
				  (interactive)
				  (window-configuration-to-register current-saved-layout)
				  (unless (window-configuration-p (car (get-register char)))
				    (window-configuration-to-register char))
				  (jump-to-register char)
				  (setq current-saved-layout char)))))
	'(0 1 2 3 4 5 6 7 8 9))

;; get me a calculator
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'calc)

;; buffer kills
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-current-buffer)
(global-set-key (kbd "M-K") 'kill-buffer-and-window)

;; compilation stuff
(global-unset-key (kbd "M-m"))
(global-unset-key (kbd "M-M"))
(global-set-key (kbd "M-m") 'next-error)
(global-set-key (kbd "M-M") 'recompile)

;; latex stuff
(require 'tex-mode)
(define-key latex-mode-map (kbd "C-c m") (lambda () (interactive)
					   (insert "\\[\n\n\\]")
					   (backward-char 3)))

;; region folding
(require 'fold-this)

;; folding keybinds
(defun fold-this-fold-forward (&optional arg)
  (interactive "p")
  (push-mark)
  (forward-sexp arg)
  (fold-this (mark) (point))
  (pop-mark))
(defun fold-this-fold-backward (&optional arg)
  (interactive "p")
  (push-mark)
  (backward-sexp arg)
  (fold-this (point) (mark))
  (pop-mark))

(define-prefix-command 'fold-map)
(global-set-key (kbd "M-F") 'fold-map)

(define-key fold-map (kbd "d") 'fold-this)
;; (global-set-key (kbd "M-F d") 'fold-this)
(define-key fold-map (kbd "e") 'fold-this-unfold-at-point)
;; (global-set-key (kbd "M-F e") 'fold-this-unfold-at-point)
(define-key fold-map (kbd "t") 'hs-toggle-hiding)
;; (global-set-key (kbd "M-F t") 'hs-toggle-hiding)
(define-key fold-map (kbd "f") 'fold-this-fold-forward)
(define-key fold-map (kbd "b") 'fold-this-fold-backward)

;; better minibuffer complete
(selectrum-mode 1)
(savehist-mode)
(setq selectrum-display-style '(horizontal))
(setq selectrum-display-action '(display-buffer-in-side-window (side . bottom) (slot . -1)))
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (orderless-matching-styles '(orderless-literal orderless-regexp orderless-prefixes))
  (orderless-skip-highlighting (lambda () selectrum-is-active))
  (selectrum-highlight-candidates-function #'orderless-highlight-matches))

;; better in-buffer completion
;; (require 'company)
;; (add-hook 'prog-mode-hook (lambda ()
;; 			    (company-mode 1)))
;; (global-unset-key (kbd "M-/"))
;; (global-set-key (kbd "M-/") 'company-complete)

;; exwm stuff
;;(load "~/.emacs.d/exwm-pref.el")

;; mail stuff
(load "~/.emacs.d/mail.el")

;; music
(load "~/.emacs.d/bongo.el")
(load "~/.emacs.d/youtube-dl.el")
(load "~/.emacs.d/bongo-populate.el")

;; allow using emacsclient
(server-start)

;; don't ask about killing buffers
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; don't ask about kill processes
(setq confirm-kill-processes nil)

;; allow doing webpage startup
(use-package edit-server
  :ensure t
  :commands edit-server-start
  :init (if after-init-time
              (edit-server-start)
            (add-hook 'after-init-hook
                      #'(lambda() (edit-server-start))))
  :config (setq edit-server-new-frame-alist
                '((name . "Edit with Emacs FRAME")
                  (top . 200)
                  (left . 200)
                  (width . 80)
                  (height . 25)
                  (minibuffer . t)
                  (menu-bar-lines . t))))

(load-file "~/.emacs.d/async-eval.el")

(load-file "~/.emacs.d/project-stuff.el")

(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'list-timers 'disabled nil)
(put 'narrow-to-region 'disabled nil)

