;;; -*- lexical-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style 'extra-line)
 '(custom-enabled-themes '(tmu-custom))
 '(custom-safe-themes
   '("6dafb31ade9ff07229faaf05c41c2ae475c44731362b792f65f3930b1a2c9cfd" "dc77e008092a5a4aa6b6ed8e4826bebf8f2fb930a8de073bf7f458efd884cca8" "d1ff3e66028f9c527298580d2a64f9e3280f07f9e94d4dada72b67ef15069441" "3d4e3644e237a95683daa73e397c4c0d1ae06bbaaf8040104232591a28bc1315" "12a07bc38295e4b06a8965db261f51ea7ea61fbf91b3ef41298bbb549d1d9403" default))
 '(ede-project-directories
   '("/home/tmu/Desktop/eway/sway" "/home/tmu/Desktop/eway/cage" "/home/tmu/Desktop/eway/wlroots" "/home/tmu/Desktop/eway/comp" "/home/tmu/Desktop/eway"))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(evil-snipe evil-surround markdown-preview-mode 2048-game evil ibuffer-project persp-mode-projectile-bridge persp-mode fish-mode spell-fu pyim chinese-conv esup buffer-move vertico flymake-diagnostic-at-point emms-state emms-player-simple-mpv eshell-fringe-status esh-help eshell-vterm vterm rustic benchmark-init ivy-prescient eat ivy-hydra ivy emms eyebrowse highlight dumb-jump volume workgroups async bongo hydra free-keys gxref fold-this simple-httpd xelb oauth2 imenu-anywhere popwin folding gdscript-mode))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
 '(whitespace-style
   '(face trailing tabs lines-tail missing-newline-at-eof indentation space-after-tab space-before-tab tab-mark)))

;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

(setq gc-cons-threshold most-positive-fixnum)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; stuff I will always want
(electric-pair-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)

;; spelling
(require 'spell-fu)
(setq ispell-personal-dictionary "/home/tmu/.aspell.en.pws")
(add-hook 'text-mode-hook (lambda () (spell-fu-mode 1)))

;; dictionaries
(define-prefix-command 'dict-map)
(global-set-key (kbd "M-l") 'dict-map)
(define-keymap :full nil
  :parent nil
  :suppress nil
  :keymap nil
  :name "dict-map"
  :prefix 'dict-map
  (kbd "w") 'sdcv-search-input
  (kbd "c") (lambda () (interactive)
              (activate-input-method 'pyim)
              (sdcv-search-input (read-from-minibuffer "Chinese Word: "
                                                       nil nil nil
                                                       nil nil t))
              (activate-input-method nil)))

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

;; custom func keybinds
(global-set-key (kbd "M-w") 'copy-region-as-kill) ;;make copying not flash cursor
(defun wrap-region-paren ()
  "Wraps the region in parens.
Similar to pressing ( with the region active."
  (interactive)
  (let ((beg (region-beginning))
        (end (region-end)))
    (save-excursion
      (goto-char beg)
      (insert "(")
      (goto-char (+ end 1))
      (insert ")")
    )))
(global-set-key (kbd "M-(") 'wrap-region-paren)
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
(global-set-key (kbd "M-z") 'zap-whitespace)
(defun wrap-sexp (&optional arg)
  "Wraps the following sexp in a pair of parens.
Places inside the new pair, with prefix arg do the same backwards, pushing the
mark.  Does the same of ARG number sexps if given"
  (interactive "P")
  (message "%s" arg)
  (if arg
      (progn
        (push-mark)
        (insert-pair -1 ?\( ?\)))
    (insert-pair 1 ?\( ?\))))
(global-set-key (kbd "C-M-z") 'wrap-sexp)

;;move buffers between windows in a convient way
(require 'buffer-move)
(global-set-key (kbd "C-x -") 'buf-move-right)

;; quick window switching
(global-set-key (kbd "M-o") 'other-window)

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

;; latex stuff
(require 'tex-mode)
(define-key latex-mode-map (kbd "C-c m") (lambda () (interactive)
                                           (push-mark)
                                           (insert "\\[\n\n\\]")
                                           (indent-region (mark) (point))
                                           (pop-mark)
                                           (previous-line)
                                           (indent-for-tab-command)
                                           ))

(add-hook 'tex-mode-hook (lambda ()
                           (setq-local compile-command
                                       (concat "pdflatex " (shell-quote-argument (buffer-file-name))))
                           (add-hook 'after-save-hook 'recompile 0 t)))

;; better minibuffer complete
(use-package vertico
  :init
  (vertico-mode)
  (vertico-flat-mode)
  (setq vertico-cycle t))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless partial-completion flex basic))
  (orderless-matching-styles '(orderless-literal orderless-regexp orderless-prefixes))
  ;; (orderless-skip-highlighting t)
  ;; (selectrum-highlight-candidates-function #'orderless-highlight-matches)
  )

;; better in-buffer completion
;; (require 'company)
;; (add-hook 'prog-mode-hook (lambda ()
;;                          (company-mode 1)))
;; (global-unset-key (kbd "M-/"))
;; (global-set-key (kbd "M-/") 'company-complete)

;; mail stuff
(autoload 'mu4e "~/.emacs.d/mail.el" "mu4e stuff" t)

;; music
;; (autoload 'youtube-dl-enqueue "~/.emacs.d/youtube-dl.el" "download from youtube" t)

(emms-all)
(require 'emms-info-native)
(defun emms-file-info (track)
  "Sets info of a track based on it's file name. Expects Artist - Album - Track.ext."
  (when (emms-track-file-p track)
    (let* ((file-name (emms-track-name track))
           (tags (string-split (car (seq-reverse (string-split file-name "/"))) " - ")))
      (emms-track-set track 'info-artist (car tags))
      (emms-track-set track 'info-album (car (cdr tags)))
      (emms-track-set track 'info-title (car (cdr (cdr tags)))))))

(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-file-info)
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

(require 'emms-state)
;; see single header, loaded AFTER this for more about emms-state


;; allow using emacsclient
(load "server")
(unless (server-running-p) (server-start))

;; mutli frame stuff
(global-set-key (kbd "C-x C-C") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") (lambda ()
                                  (interactive)
                                  (if (eq 1 (length (frame-list)))
                                      ;; sole frame, exit
                                      (save-buffers-kill-terminal)
                                    (delete-frame))))

;; don't ask about killing buffers
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; don't ask about kill processes
(setq confirm-kill-processes nil)

(autoload 'async-eval "~/.emacs.d/async-eval.el" "evaluate in another emacs process" t)

(load-file "~/.emacs.d/project-stuff.el")

(load-file "~/.emacs.d/single-header.el")

(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'list-timers 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; no tabs
(setq-default indent-tabs-mode nil)

;; input method stuff
(setq rime-translate-keybindings
      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
(setq rime-share-data-dir "~/.local/share/fcitx5/rime")
(setq rime-show-candidate 'popup)

;; evil mode stuff
(evil-mode 1)
(define-key evil-motion-state-map (kbd "TAB") 'indent-for-tab-command)
(setq evil-want-C-d-scroll nil
      evil-want-C-w-delete nil
      evil-disable-insert-state-bindings t)
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package evil-snipe
  :ensure t
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1)
  (setq evil-snipe-scope 'buffer)
  (evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
  (evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S))
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:background "gray10" :foreground "cyan" :box nil :weight bold))))
 '(vterm-color-blue ((t (:inherit ansi-color-bright-green)))))
(put 'downcase-region 'disabled nil)
