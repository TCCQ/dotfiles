;;; -*- LEXICAL-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style 'extra-line)
 '(connection-local-criteria-alist
   '(((:application vc-git)
      vc-git-connection-default-profile)
     ((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile tramp-flatpak-connection-local-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((vc-git-connection-default-profile
      (vc-git--program-version))
     (tramp-flatpak-connection-local-default-profile
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
 '(custom-safe-themes
   '("6f5e3fd2b4245ffe660da69ea5c13ab392337e94776dfb23cc1d8d0f80e3baa2" "1b8c2fd98bf6777d8b95f8cf98fdaede88feee3419ec3e5008f94b56618ac6ca" "0cc5046b7981609166c28b64f6185fa5f73bcb00d21e037f304794c6aaa1f340" "9f2e4e8b2ddbfdd392eedbc123649d94654278dee5a53b899557224416413d35" "6dafb31ade9ff07229faaf05c41c2ae475c44731362b792f65f3930b1a2c9cfd" "dc77e008092a5a4aa6b6ed8e4826bebf8f2fb930a8de073bf7f458efd884cca8" "d1ff3e66028f9c527298580d2a64f9e3280f07f9e94d4dada72b67ef15069441" "3d4e3644e237a95683daa73e397c4c0d1ae06bbaaf8040104232591a28bc1315" "12a07bc38295e4b06a8965db261f51ea7ea61fbf91b3ef41298bbb549d1d9403" default))
 '(ede-project-directories
   '("/home/tmu/Desktop/eway/sway" "/home/tmu/Desktop/eway/cage" "/home/tmu/Desktop/eway/wlroots" "/home/tmu/Desktop/eway/comp" "/home/tmu/Desktop/eway"))
 '(eglot-events-buffer-config '(:size 0 :format full))
 '(gdb-non-stop-setting nil)
 '(helm-minibuffer-history-key "M-p")
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(em-term em-hist embark-consult embark eat em-smart all-the-icons-completion all-the-icons marginalia visible-mark benchmark-init sideline-lsp sideline-flymake sideline-flycheck sideline lsp-haskell lsp-sourcekit emacs-lsp elisp-sandbox elsa lsp-mode corfu evil-config which-key orderless vertico evil))
 '(pyim-assistant-scheme 'cangjie)
 '(safe-local-variable-values '((LEXICAL-binding . t)))
 '(scroll-bar-mode nil)
 '(tags-revert-without-query t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
 '(whitespace-style
   '(face trailing tabs lines-tail missing-newline-at-eof indentation space-after-tab space-before-tab tab-mark) t))

;; ---------------------------------------------------------------------
;; non-package specific config

;; performance stuff
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; allow using emacsclient
(require 'server)
(unless (server-running-p) (server-start))

;; buffer preferences
(with-current-buffer "*scratch*" (emacs-lock-mode 'kill))
(setq kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
;; don't ask about killing buffers
(setq confirm-kill-processes nil)
;; don't ask about kill processes


(setq async-shell-command-buffer 'new-buffer)
;; start additional async shell commands in new buffers without asking
(setq-default proced-auto-update-flag t)
;; always auto update proced

;; --------------------------------------------------------------------
;; external packages

(use-package benchmark-init
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; enable external packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(push "~/.emacs.d/site-lisp/" load-path)
(package-initialize)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; (setq use-package-always-demand t)

(use-package vertico
  ;; better minibuffer complete
  :init
  (vertico-mode)
  ;; (vertico-flat-mode)
  (setq vertico-cycle t))

(use-package marginalia
  :init
  (marginalia-mode)
  (keymap-set minibuffer-local-map "M-A" 'marginalia-cycle)
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right))

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-," . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)  ;; alternative for `describe-bindings'
   )
  :init
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package all-the-icons)
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))

(use-package orderless
  ;; ordering (minibuffer) completions
  :custom
  (completion-styles '(orderless basic))
  (orderless-matching-styles '(orderless-prefixes orderless-initialism orderless-literal orderless-regexp))
  ;; (orderless-skip-highlighting t)
  )

(use-package corfu
  ;; in buffer completion
  :init
  (global-corfu-mode 1)
  (defun corfu-commit-single ()
    "Complete without asking if there is only one candidate."
    (when (and (corfu--popup-visible-p)
               (= (length corfu--candidates) 1))
      (corfu-accept)))
  (add-hook 'corfu-post-command-hook 'corfu-commit-single)
  :custom
  (corfu-cycle t)
  (corfu-quit-no-match t)
  :bind (("M-/" . completion-at-point)))

(use-package cape
  ;; extend completion frameworks
  :bind ("C-c p" . cape-prefix-map)
  :config
  (advice-add 'pcomplete-completions-at-point :around 'cape-wrap-silent)
  (advice-add 'pcomplete-completions-at-point :around 'cape-wrap-purify)
  :custom
  (completion-at-point-functions . '(cape-dict
                                     tags-completion-at-point-function
                                     cape-keyword
                                     cape-dabbrev
                                     cape-symbol)))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind ( ;; ("M-/" . completion-at-point)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package tempel
  :after (cape)
  :custom
  (tempel-path "~/.emacs.d/templates/*.eld")
  ;; (tempel-trigger-prefix "<")

  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :config
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
  )

;; (use-package tempel-collection
;;   :after tempel)

(use-package which-key
  :init
  (which-key-mode))

(use-package ibuffer
  :custom
  (ibuffer-formats
   '((mark modified read-only " "
           (name 50 50 :left :elide) ; was originally 18
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename))))

(use-package buffer-move
  :bind ("C-x -" . buf-move-right))

(use-package consult
  :custom (consult-preview-excluded-buffers '(major-mode . exwm-mode))
  :bind ("C-x b" . consult-buffer))

;; (use-package beacon
;;   :init
;;   (beacon-mode 1)
;;   (push 'vterm-mode beacon-dont-blink-major-modes))

(use-package visible-mark
  :init
  (global-visible-mark-mode 1)
  (set-face-attribute 'visible-mark-active nil
                      :foreground 'unspecified
                      :background 'unspecified
                      :box '(:line-width (-1 . -1)
                                         :color "deep pink"
                                         :style nil))
  :custom
  (visible-mark-max 1)
  )

;; eshell stuff
(use-package eshell
  :init
  (use-package esh-help)
  (setup-esh-help-eldoc)
  (require 'em-hist)
  (require 'em-term)
  (keymap-set eshell-hist-mode-map "C-p" 'eshell-previous-input)
  (keymap-set eshell-hist-mode-map "C-n" 'eshell-next-input)
  (keymap-set eshell-hist-mode-map "C-c C-n" 'next-line)
  (keymap-set eshell-hist-mode-map "C-c C-p" 'previous-line)
  (keymap-set eshell-mode-map "C-l" 'eshell/clear)
  (add-hook 'eshell-mode-hook 'eldoc-mode))

(use-package eat
  :init
  (add-hook 'eshell-load-hook #'eat-eshell-mode)
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)
  (push "pass" eshell-visual-commands))

;; ----------------------------------------------------------------------
;; my custom stuff

;; (require 'evil-config)
(require 'my-funcs)
(require 'my-binds)
(require 'coding-config)
(require 'modeline-config)
(require 'general-text)
(require 'exwm-pref)

;; ----------------------------------------------------------------------
;; theme stuff

(require 'tmu-custom-theme)
(push "~/.emacs.d/site-lisp/" custom-theme-load-path)
(load-theme 'tmu-custom t)

;; comfy scratch buffer
(require 'iimage)
(setq inhibit-startup-screen t)
(setq initial-scratch-message (concat (propertize ";; " 'invisible t)
                                      "</home/tmu/.emacs.d/splashLaputa.png>
;; scratch for lisp evaluation and unsaved text

"))
(add-hook 'emacs-startup-hook (lambda ()
                                (with-current-buffer "*scratch*"
                                  (iimage-mode 1))))

;; ----------------------------------------------------------------------
;; Things emacs sets programatically
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'list-timers 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(load-theme 'tmu-custom t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
