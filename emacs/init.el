;;; -*- LEXICAL-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t t)
 '(TeX-source-correlate-start-server t t)
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "Okular")
     (output-pdf "Okular")
     (output-html "xdg-open")))
 '(comment-style 'extra-line)
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile tramp-flatpak-connection-local-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
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
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
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
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
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
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))
     (eshell-connection-default-profile
      (eshell-path-env-list))))
 '(custom-enabled-themes '(tmu-custom))
 '(custom-safe-themes
   '("9f2e4e8b2ddbfdd392eedbc123649d94654278dee5a53b899557224416413d35" "6dafb31ade9ff07229faaf05c41c2ae475c44731362b792f65f3930b1a2c9cfd" "dc77e008092a5a4aa6b6ed8e4826bebf8f2fb930a8de073bf7f458efd884cca8" "d1ff3e66028f9c527298580d2a64f9e3280f07f9e94d4dada72b67ef15069441" "3d4e3644e237a95683daa73e397c4c0d1ae06bbaaf8040104232591a28bc1315" "12a07bc38295e4b06a8965db261f51ea7ea61fbf91b3ef41298bbb549d1d9403" default))
 '(custom-theme-directory "~/.emacs.d/personal-lisp")
 '(ede-project-directories
   '("/home/tmu/Desktop/eway/sway" "/home/tmu/Desktop/eway/cage" "/home/tmu/Desktop/eway/wlroots" "/home/tmu/Desktop/eway/comp" "/home/tmu/Desktop/eway"))
 '(evil-collection-mode-list
   '(2048-game ag alchemist anaconda-mode apropos arc-mode atomic-chrome auto-package-update beginend bluetooth bm bookmark
               (buff-menu "buff-menu")
               calendar cider cmake-mode color-rg comint company compile consult corfu crdt
               (custom cus-edit)
               cus-theme dashboard daemons deadgrep debbugs debug devdocs dictionary diff-hl diff-mode dired dired-sidebar disk-usage distel doc-view docker ebib ebuku edbi edebug ediff eglot elpaca ement explain-pause-mode eldoc elfeed elisp-mode elisp-refs elisp-slime-nav embark emms emoji epa ert eshell eval-sexp-fu evil-mc eww fanyi finder flycheck flymake forge free-keys geiser ggtags git-timemachine gited gnus go-mode grep guix hackernews helm help helpful hg-histedit hungry-delete ibuffer
               (image image-mode)
               image-dired image+ imenu imenu-list
               (indent "indent")
               indium info ivy js2-mode leetcode lispy lms log-edit log-view lsp-ui-imenu lua-mode kotlin-mode macrostep man
               (magit magit-repos magit-submodule)
               magit-section magit-todos markdown-mode monky mpc mpdel mu4e mu4e-conversation neotree newsticker notmuch nov omnisharp org org-present org-roam osx-dictionary outline p4
               (package-menu package)
               pass
               (pdf pdf-view)
               popup proced
               (process-menu simple)
               prodigy profiler python quickrun racer racket-describe realgud reftex replace restclient rg ripgrep rjsx-mode robe rtags ruby-mode scheme scroll-lock selectrum sh-script shortdoc simple simple-mpc slime sly snake so-long speedbar tab-bar tablist tabulated-list tar-mode telega
               (term term ansi-term multi-term)
               tetris thread tide timer-list transmission trashed tuareg typescript-mode vc-annotate vc-dir vc-git vdiff vertico view vlf vterm vundo w3m wdired wgrep which-key woman xref xwidget yaml-mode youtube-dl zmusic
               (ztree ztree-diff ztree-dir)))
 '(helm-minibuffer-history-key "M-p")
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(counsel hide-lines 2048-game async auctex benchmark-init bongo buffer-move calc-prog-utils chinese-conv company-cabal company-go dumb-jump eat emms emms-player-simple-mpv emms-state esh-help eshell-fringe-status eshell-vterm esup evil evil-collection evil-commentary evil-easymotion evil-snipe evil-surround exwm eyebrowse fish-mode flymake-diagnostic-at-point fold-this folding free-keys frog-jump-buffer gdscript-mode gxref haskell-mode helm-hoogle highlight hindent hydra ibuffer-project imenu-anywhere ivy-prescient oauth2 persp-mode persp-mode-projectile-bridge popwin pyim-basedict pyim-cangjiedict pyim-wbdict rustic shm sideline-flymake sideline-lsp solarized-theme tree-sitter unicode-fonts volume workgroups xelb))
 '(persp-restore-window-conf-method nil)
 '(pyim-assistant-scheme 'quanpin)
 '(safe-local-variable-values '((LEXICAL-binding . t)))
 '(scroll-bar-mode nil)
 '(tags-revert-without-query t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
 '(whitespace-style
   '(face trailing tabs lines-tail missing-newline-at-eof indentation space-after-tab space-before-tab tab-mark))
 '(xref-show-definitions-function 'xref-show-definitions-buffer-at-bottom))

;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; performance stuff
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; allow using emacsclient
(load "server")
(unless (server-running-p) (server-start))

;; buffer preferences
(with-current-buffer "*scratch*" (emacs-lock-mode 'kill))
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions)) ;; don't ask about killing buffers
(setq confirm-kill-processes nil) ;; don't ask about kill processes

;; enable external packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; general editing config for everywhere
(electric-pair-mode 1)
(global-hl-line-mode 1)
(global-hl-todo-mode 1)
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil) ;; no tabs
(setq fill-column 80)
(setq whitespace-style
      '(face trailing tabs missing-newline-at-eof indentation space-after-tab space-before-tab tab-mark))

;; nice startup
(add-to-list 'default-frame-alist '(alpha-background . 90)) ;; transparancy
(require 'iimage)
(setq inhibit-startup-screen t)
(setq initial-scratch-message (concat (propertize ";; " 'invisible t)
                                      "</home/tmu/.emacs.d/splashLaputa.png>
;; scratch for lisp evaluation and unsaved text

"))
(add-hook 'emacs-startup-hook (lambda ()
                                (with-current-buffer "*scratch*"
                                  (iimage-mode 1))))

(use-package vertico
  ;; better minibuffer complete
  :init
  (vertico-mode)
  (vertico-flat-mode)
  (setq vertico-cycle t))

(use-package orderless
  ;; ordering minibuffer completions
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

;; frog jump stuff
(add-hook 'frog-menu-after-init-hook (lambda ()
                                       (setq-local avy-background nil)))

(load-file "~/.emacs.d/personal-lisp/custom-funcs.el")
(load-file "~/.emacs.d/personal-lisp/evil-conf.el")
(load-file "~/.emacs.d/personal-lisp/general-text.el")
(load-file "~/.emacs.d/personal-lisp/tex-conf.el")
(load-file "~/.emacs.d/personal-lisp/coding-config.el")
(load-file "~/.emacs.d/personal-lisp/single-header.el")
(load-file "~/.emacs.d/personal-lisp/chinese.el")
(load-file "~/.emacs.d/personal-lisp/custom-binds.el")
;; (load-file "~/.emacs.d/exwm-pref.el")

;; emacs mechanically set stuff
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'list-timers 'disabled nil)
(put 'narrow-to-region 'disabled nil)
