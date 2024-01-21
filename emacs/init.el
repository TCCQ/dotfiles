;;; -*- LEXICAL-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager) "dvi2tty")
     ((output-dvi style-pstricks) "dvips and gv")
     (output-dvi "Okular") (output-pdf "Okular")
     (output-html "xdg-open")))
 '(comment-style 'extra-line)
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile
      tramp-flatpak-connection-local-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)
     ((:application eshell) eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . tramp-ps-time)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time)
                                          (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string)
                                          (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . number)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))
     (eshell-connection-default-profile (eshell-path-env-list))))
 '(custom-enabled-themes '(tmu-custom))
 '(custom-safe-themes
   '("6dafb31ade9ff07229faaf05c41c2ae475c44731362b792f65f3930b1a2c9cfd"
     "dc77e008092a5a4aa6b6ed8e4826bebf8f2fb930a8de073bf7f458efd884cca8"
     "d1ff3e66028f9c527298580d2a64f9e3280f07f9e94d4dada72b67ef15069441"
     "3d4e3644e237a95683daa73e397c4c0d1ae06bbaaf8040104232591a28bc1315"
     "12a07bc38295e4b06a8965db261f51ea7ea61fbf91b3ef41298bbb549d1d9403"
     default))
 '(ede-project-directories
   '("/home/tmu/Desktop/eway/sway" "/home/tmu/Desktop/eway/cage"
     "/home/tmu/Desktop/eway/wlroots" "/home/tmu/Desktop/eway/comp"
     "/home/tmu/Desktop/eway"))
 '(evil-collection-mode-list
   '(2048-game ag alchemist anaconda-mode apropos arc-mode atomic-chrome
               auto-package-update beginend bluetooth bm bookmark
               (buff-menu "buff-menu") calendar cider cmake-mode
               color-rg comint company compile consult corfu crdt
               (custom cus-edit) cus-theme dashboard daemons deadgrep
               debbugs debug devdocs dictionary diff-hl diff-mode
               dired dired-sidebar disk-usage distel doc-view docker
               ebib ebuku edbi edebug ediff eglot elpaca ement
               explain-pause-mode eldoc elfeed elisp-mode elisp-refs
               elisp-slime-nav embark emms emoji epa ert eshell
               eval-sexp-fu evil-mc eww fanyi finder flycheck flymake
               forge free-keys geiser ggtags git-timemachine gited
               gnus go-mode grep guix hackernews helm help helpful
               hg-histedit hungry-delete ibuffer (image image-mode)
               image-dired image+ imenu imenu-list (indent "indent")
               indium info ivy js2-mode leetcode lispy lms log-edit
               log-view lsp-ui-imenu lua-mode kotlin-mode macrostep
               man (magit magit-repos magit-submodule) magit-section
               magit-todos markdown-mode monky mpc mpdel mu4e
               mu4e-conversation neotree newsticker notmuch nov
               omnisharp org org-present org-roam osx-dictionary
               outline p4 (package-menu package) pass (pdf pdf-view)
               popup proced (process-menu simple) prodigy profiler
               python quickrun racer racket-describe realgud reftex
               replace restclient rg ripgrep rjsx-mode robe rtags
               ruby-mode scheme scroll-lock selectrum sh-script
               shortdoc simple simple-mpc slime sly snake so-long
               speedbar tab-bar tablist tabulated-list tar-mode telega
               (term term ansi-term multi-term) tetris thread tide
               timer-list transmission trashed tuareg typescript-mode
               vc-annotate vc-dir vc-git vdiff vertico view vlf vterm
               vundo w3m wdired wgrep which-key woman xref xwidget
               yaml-mode youtube-dl zmusic
               (ztree ztree-diff ztree-dir)))
 '(helm-minibuffer-history-key "M-p")
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(2048-game async auctex benchmark-init bongo buffer-move
               calc-prog-utils chinese-conv company-cabal company-go
               dumb-jump eat emms emms-player-simple-mpv emms-state
               esh-help eshell-fringe-status eshell-vterm esup evil
               evil-collection evil-commentary evil-easymotion
               evil-snipe evil-surround exwm eyebrowse fish-mode
               flymake-diagnostic-at-point fold-this folding free-keys
               frog-jump-buffer gdscript-mode gxref haskell-mode
               helm-hoogle highlight hindent hydra ibuffer-project
               imenu-anywhere ivy-prescient oauth2 persp-mode
               persp-mode-projectile-bridge popwin pyim-basedict
               pyim-cangjiedict pyim-wbdict rustic shm
               sideline-flymake sideline-lsp solarized-theme
               tree-sitter unicode-fonts volume workgroups xelb))
 '(persp-restore-window-conf-method nil)
 '(pyim-assistant-scheme 'quanpin)
 '(safe-local-variable-values '((LEXICAL-binding . t)))
 '(scroll-bar-mode nil)
 '(tags-revert-without-query t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
 '(whitespace-style
   '(face trailing tabs lines-tail missing-newline-at-eof indentation
          space-after-tab space-before-tab tab-mark))
 '(xref-show-definitions-function 'xref-show-definitions-buffer-at-bottom))

;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

(setq gc-cons-threshold most-positive-fixnum)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; Don't kill scratch ever
(with-current-buffer "*scratch*"
  (emacs-lock-mode 'kill))

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

;; chinese
;; (require 'unicode-fonts)
;; (unicode-fonts-setup)
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
;; (require 'pyim-wbdict)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
;; (pyim-wbdict-v98-morphe-enable)
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "FangSong" :size 15)))
;; (setq rime-translate-keybindings
;;       '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
;; (setq rime-share-data-dir "~/.local/share/fcitx5/rime")
;; (setq rime-show-candidate 'popup)

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
(global-set-key (kbd "M-w") 'copy-region-as-kill) ;;make copying not flash cursor
(global-set-key (kbd "M-(") 'wrap-region-paren)
(global-set-key (kbd "M-z") 'zap-whitespace)
(global-set-key (kbd "C-M-z") 'wrap-sexp)
;;move buffers between windows in a convient way
(require 'buffer-move)
(global-set-key (kbd "C-x -") 'buf-move-right)
;; quick window switching
(global-set-key (kbd "M-o") 'other-window)
;; get me a calculator
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'calc)
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-current-buffer)
(global-set-key (kbd "M-K") 'kill-buffer-and-window)
(global-set-key (kbd "M-U") 'scroll-lock-mode)
(global-set-key (kbd "M-Q") 'auto-fill-mode)

;; save/restore window config
;; (setq current-saved-layout ?0)
;; (seq-do (lambda (number)
;;           (let* ((string (int-to-string number))
;;                  (char (string-to-char string))
;;                  (key (kbd (concat "M-" string))))
;;             (global-unset-key key)
;;             (global-set-key key (lambda ()
;;                                   (interactive)
;;                                   (window-configuration-to-register current-saved-layout)
;;                                   (unless (window-configuration-p (car (get-register char)))
;;                                     (window-configuration-to-register char))
;;                                   (jump-to-register char)
;;                                   (setq current-saved-layout char)))))
;;         '(0 1 2 3 4 5 6 7 8 9))

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

;; (add-hook 'tex-mode-hook (lambda ()
;;                            (setq-local compile-command
;;                                        (concat "pdflatex " (shell-quote-argument (buffer-file-name))))
;;                            (add-hook 'after-save-hook 'recompile 0 t)))

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

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

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

;; (emms-all)
;; (require 'emms-info-native)
;; (defun emms-file-info (track)
;;   "Sets info of a track based on it's file name. Expects Artist - Album - Track.ext."
;;   (when (emms-track-file-p track)
;;     (let* ((file-name (emms-track-name track))
;;            (tags (string-split (car (seq-reverse (string-split file-name "/"))) " - ")))
;;       (emms-track-set track 'info-artist (car tags))
;;       (emms-track-set track 'info-album (car (cdr tags)))
;;       (emms-track-set track 'info-title (car (cdr (cdr tags)))))))

;; (setq emms-player-list '(emms-player-mpv)
;;       emms-info-functions '(emms-file-info)
;;       emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

;; (require 'emms-state)
;; ;; see single header, loaded AFTER this for more about emms-state


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

;; evil mode stuff
(setq
      evil-want-keybinding nil
      evil-want-integration t)
;; evil-want-C-d-scroll nil
;;       evil-want-C-w-delete nil
;;       evil-disable-insert-state-bindings t
;;       evil-respect-visual-line-mode t
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))
(evil-mode 1)
(evilem-default-keybindings "SPC")
(define-key evil-motion-state-map (kbd "TAB") 'indent-for-tab-command)
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
(define-key evil-normal-state-map (kbd "C-t") 'transpose-chars)

(add-hook 'prog-mode-hook (lambda ()
                           (modify-syntax-entry ?_ "w") ))

(add-hook 'dired-mode-hook (lambda ()
                             (define-key evil-normal-state-local-map (kbd "C-o")
                                         'dired-display-file)))

;;; sashka bindings
;; movement
(defun evil-window-split-and-switch ()
  "Split the window vertically and switch to the new buffer."
  (interactive)
  (evil-window-split)
  (other-window 1))

(defun evil-window-vsplit-and-switch ()
  "Split the window horizontally and switch to the new buffer."
  (interactive)
  (evil-window-vsplit)
  (other-window 1))

(evil-define-key 'normal global-map (kbd "SPC i") 'imenu)
(evil-define-key 'normal global-map (kbd "SPC RET") 'vterm)
(evil-define-key 'normal global-map (kbd "SPC v") 'vterm)
(evil-define-key 'normal global-map (kbd "SPC !") 'abort-recursive-edit)
(evil-define-key 'normal global-map (kbd "SPC f f")  'find-file)

(evil-define-key 'normal global-map (kbd "SPC SPC SPC j") 'evil-window-split-and-switch)
(evil-define-key 'normal global-map (kbd "SPC SPC SPC k") 'evil-window-split-and-switch)
(evil-define-key 'normal global-map (kbd "SPC SPC SPC h") 'evil-window-vsplit-and-switch)
(evil-define-key 'normal global-map (kbd "SPC SPC SPC l") 'evil-window-vsplit-and-switch)
(evil-define-key 'normal global-map (kbd "SPC SPC h") 'evil-window-left)
(evil-define-key 'normal global-map (kbd "SPC SPC j") 'evil-window-down)
(evil-define-key 'normal global-map (kbd "SPC SPC k") 'evil-window-up)
(evil-define-key 'normal global-map (kbd "SPC SPC l") 'evil-window-right)
(evil-define-key 'normal global-map (kbd "SPC SPC w") 'delete-window)
(evil-define-key 'normal global-map (kbd "SPC SPC q") 'delete-window)
(evil-define-key 'normal global-map (kbd "SPC SPC b") 'balance-windows)
(evil-define-key 'normal global-map (kbd "SPC s s") 'save-buffer)
(evil-define-key 'normal global-map (kbd "SPC s f")  'counsel-find-file)
(evil-define-key 'normal global-map (kbd "SPC s r")  'counsel-rg)
(evil-define-key 'normal global-map (kbd "SPC ;") 'frog-jump-buffer)

;; frog jump stuff
(add-hook 'frog-menu-after-init-hook (lambda ()
                                       (setq-local avy-background nil)))

(load-file "~/.emacs.d/coding-config.el")

(load-file "~/.emacs.d/exwm-pref.el")

(load-file "~/.emacs.d/single-header.el")

(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'list-timers 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; no tabs
(setq-default indent-tabs-mode nil)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frog-menu-posframe-background-face ((t (:background "RoyalBlue4"))))
 '(minibuffer-prompt ((t (:background "gray10" :foreground "cyan" :box nil :weight bold))))
 '(pyim-page ((t (:inherit default :background "#333333" :foreground "#dcdccc"))))
 '(vterm-color-blue ((t (:inherit ansi-color-bright-green)))))
(put 'downcase-region 'disabled nil)
