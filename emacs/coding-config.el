;;; project-stuff --- Things I want for coding mostly

;;; Commentary:

;;; Just want to seperate the coding stuff from my other init stuff


(add-hook 'xref-backend-functions 'gxref-xref-backend)

;; don't forget that eglot exists
;; (global-company-mode 1)
;; (setq company-idle-delay 0.1)

;; (require 'semantic/sb)
;; (setq semantic-default-submodes
;;       '(global-semantic-idle-scheduler-mode
;;      semantic-db-minor-mode
;;      global-semantic-idle-summary-mode
;;      global-semantic-idle-completions-mode
;;      global-semantic-highlight-func-mode
;;      global-semantic-mru-bookmark-mode
;;      global-semantic-idle-local-symbol-highlight-mode)
;;       semantic-idle-scheduler-work-idle-time 5)
;; (semantic-mode 1
;; (global-ede-mode t)

;; better commenting stuff
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x ;") 'comment-line)
(global-set-key (kbd "C-x :") 'comment-set-column) ;never gonna use but whatever

(setq asm-comment-char ?#)

(add-hook 'asm-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      (lambda ()
                        (shell-command
                         "find . -iregex '.*\\.[sS]' -exec etags -l none -r '/\\([a-zA-Z0-9\\-_]+\\):/\1/' {} +"))
                      0 t)))

;; nice eglot binds
(global-set-key (kbd "C-c f") 'eglot-code-action-quickfix)
(global-set-key (kbd "C-c C-f") 'eglot-code-actions)

;; deal white whitespace better
(setq whitespace-style
      '(face trailing tabs missing-newline-at-eof indentation space-after-tab space-before-tab tab-mark))
(setq fill-column 80)
(global-hl-todo-mode 1)


;; (require 'sr-speedbar "~/.emacs.d/sr-speedbar.el" nil)
;; (defun speedbar-switch-and-setup ()
;;   "Switch in and out of the speedbar, opening as necessary."
;;   (interactive)
;;   (if (eq major-mode 'speedbar-mode)
;;       (select-window (previous-window))
;;     (let ((cur (current-buffer))
;;           (win (get-buffer-window "*SPEEDBAR*")))
;;       (if win
;;           (select-window win)
;;         (sr-speedbar-toggle)
;;         (select-window (get-buffer-window "*SPEEDBAR*")))
;;       (sr-speedbar-refresh)
;;       (speedbar-find-selected-file (buffer-file-name cur))
;;       (speedbar-expand-line))))

;; (define-key speedbar-mode-map (kbd "q") 'sr-speedbar-toggle)
;; (global-unset-key (kbd "M-i"))
(global-set-key (kbd "M-i") 'imenu)

(global-set-key (kbd "M-Z") 'suspend-frame)

;; indent code when pasting, from
;; https://trey-jackson.blogspot.com/2008/03/emacs-tip-15-indent-yanked-code.html

;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(emacs-lisp-mode
                            c-mode c++-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode
                            rust-mode
                            rustic-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large.
BEG and END define the region."
  (indent-region beg end nil))

(defadvice yank (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice evil-paste-before (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice evil-paste-after (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))


;; make ibuffer play with projectile
(require 'ibuffer)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;; make shells and whatnot slightly better
(require 'comint)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)

;; code folding

(add-to-list 'load-path "~/.emacs.d/")
;; (require 'ts-foldV)

(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
(global-set-key (kbd "C-c /") 'hide-lines)

;; region folding
(autoload 'fold-this "fold-this" "arbitrary folding" t)
(autoload 'fold-this-unfold-at-point "fold-this" "arbitrary folding" t)

;; folding keybinds
(defun fold-this-fold-forward (&optional arg)
  "Fold forward ARG number of sexps, defaulting to one."
  (interactive "p")
  (push-mark)
  (forward-sexp arg)
  (fold-this (mark) (point))
  (pop-mark))
(defun fold-this-fold-backward (&optional arg)
  "Fold backward ARG number of sexps, defaulting to one."
  (interactive "p")
  (push-mark)
  (backward-sexp arg)
  (fold-this (point) (mark))
  (pop-mark))

(define-prefix-command 'fold-map)
(global-set-key (kbd "M-F") 'fold-map)

(define-keymap :full nil
  :parent nil
  :suppress nil
  :keymap nil
  :name "fold-map"
  :prefix 'fold-map
  (kbd "c") 'fold-this
  (kbd "e") 'fold-this-unfold-at-point
  (kbd "t") 'hs-toggle-hiding
  (kbd "f") 'fold-this-fold-forward
  (kbd "b") 'fold-this-fold-backward
  (kbd "l") 'hs-hide-level)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;        LaTeX         ;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ##### Don't forget to configure
;; ##### Okular to use emacs in
;; ##### "Configuration/Configure Okular/Editor"
;; ##### => Editor => Emacsclient. (you should see
;; ##### emacsclient -a emacs --no-wait +%l %f
;; ##### in the field "Command".

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; ##### Always ask for the master file
;; ##### when creating a new TeX file.
(setq-default TeX-master nil)

;; ##### Enable synctex correlation. From Okular just press
;; ##### Shift + Left click to go to the good line.
(setq TeX-source-correlate-mode t
      TeX-source-correlate-start-server t)

;; ### Set Okular as the default PDF viewer.
(eval-after-load "tex"
  '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))

(add-hook 'tex-mode-hook (lambda ()
                           (setq spell-fu-faces-exclude
                                 '(tex-math
                                   font-lock-builtin-face
                                   font-lock-keyword-face
                                   font-lock-function-name-face
                                   font-lock-variable-name-face
                                   font-latex-sedate-face))
                           (outline-minor-mode 1)))

(defun clean-prog-file (buffer)
  "Fixes whitespace in buffer"
  (save-excursion
    (with-current-buffer buffer
      (untabify (point-min) (point-max))
      (goto-char (point-min))
      (while (re-search-forward " +$" nil t)
        (replace-match "" nil nil)))))

(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode 1)
                            ;; (flymake-mode 1)
                            (spell-fu-mode 0)
                            (superword-mode 1)
                            (whitespace-mode 1)
                            (display-fill-column-indicator-mode 1)
                            (add-hook 'before-save-hook
                                      (lambda ()
                                        (if (not (eq major-mode 'makefile-gmake-mode))
                                            (clean-prog-file (current-buffer)))))))


;; (add-hook 'haskell-mode-hook (lambda ()
;;                                (evil-define-key 'normal local-map (kbd "M-.") 'haskell-jump-to-def)
;;                                ))
(setq haskell-tags-on-save t)
(add-hook 'haskell-mode-hook (lambda ()
                               (hindent 1)
                               (interactive-haskell-mode 1)
                               (eldoc-mode 1)))
(setq haskell-process-type 'cabal-repl)
;; (speedbar-add-supported-extension ".hs")
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

;; (use-package flymake-diagnostic-at-point
;;   :after flymake
;;   :config
;;   (setq flymake-diagnostic-at-point-timer-delay 1)
;;   (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

(use-package sideline
  :init
  (setq sideline-backends-skip-current-line t  ; don't display on current line
        sideline-order-left 'down              ; or 'up
        sideline-order-right 'up               ; or 'down
        sideline-format-left "%s   "           ; format for left aligment
        sideline-format-right "   %s"          ; format for right aligment
        sideline-priority 100                  ; overlays' priority
        sideline-display-backend-name t)      ; display the backend name
  :hook ((flycheck-mode . sideline-mode)   ; for `sideline-flycheck`
         (flymake-mode  . sideline-mode))  ; for `sideline-flymake`
  :init
  (setq sideline-backends-right '(sideline-flymake)))


;; eshell stuff
(require 'eshell)
(require 'esh-help)
(setup-esh-help-eldoc)
(add-hook 'eshell-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'eshell-mode-hook 'eshell-fringe-status-mode)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands 'not-even-short-output)
(setq eshell-smart-space-goes-to-end t)
(add-to-list 'eshell-modules-list 'eshell-smart)
(eshell-vterm-mode 1)
(setq eshell-visual-commands
      (append eshell-visual-commands
              '("ytfzf" "nmtui" "w3m")))

(add-hook 'vterm-mode-hook (lambda ()
                             (hl-line-mode 0)))
(add-hook 'eshell-mode-hook (lambda ()
                             (hl-line-mode 0)))

(define-key vterm-mode-map (kbd "M-W") 'persp-switch-to-buffer)
(define-key vterm-mode-map (kbd "M-k") 'persp-kill-buffer)
(define-key vterm-mode-map (kbd "M-p") 'persp-key-map)

(require 'evil)
(evil-set-initial-state 'vterm-mode 'emacs)

(define-key eshell-mode-map (kbd "M-o") 'other-window)
(define-key eshell-mode-map (kbd "M-W") 'switch-buffer)
(define-key eshell-mode-map (kbd "C-l") (lambda ()
                                          (interactive)
                                          (recenter-top-bottom 0)))

;; compilation stuff
(global-set-key (kbd "M-m") (lambda ()
                              (interactive)
                              (if flymake-mode
                                  (flymake-goto-next-error)
                                (next-error))))
(global-set-key (kbd "M-M") 'recompile)
(setq compilation-always-kill t
      compilation-scroll-output t)
;; Allow compilation buffer to be dedicated across frames
(push '("\\*compilation\\*" . (nil (reusable-frames . t))) display-buffer-alist)


;; better searching
(setq counsel-grep-base-command
      "rg -i -M 120 --no-heading --line-number --color never '%s' %s")
(global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
(global-set-key (kbd "C-S-s") 'isearch-forward)
(define-key evil-normal-state-map (kbd "C-r") 'counsel-rg)

(require 'persp-mode)
;; (persp-mode 1)


(with-eval-after-load "persp-mode"
  (defvar after-switch-to-buffer-functions nil)
  (defvar after-display-buffer-functions nil)

  (if (fboundp 'advice-add)
      ;;Modern way
      (progn
        (defun after-switch-to-buffer-adv (&rest r)
          (apply #'run-hook-with-args 'after-switch-to-buffer-functions r))
        (defun after-display-buffer-adv (&rest r)
          (apply #'run-hook-with-args 'after-display-buffer-functions r))
        (advice-add #'switch-to-buffer :after #'after-switch-to-buffer-adv)
        (advice-add #'display-buffer   :after #'after-display-buffer-adv))

    (add-hook 'after-switch-to-buffer-functions
              #'(lambda (bn) (when (and persp-mode
                                        (not persp-temporarily-display-buffer))
                               (persp-add-buffer bn)))))

  (setq persp-add-buffer-on-after-change-major-mode 'free
        persp-autokill-buffer-on-remove t
        persp-kill-foreign-buffer-behaviour 'dont-ask)
  (global-set-key (kbd "M-p") 'persp-key-map)
  (global-set-key (kbd "C-x b") #'persp-switch-to-buffer)
  (global-set-key (kbd "C-x B") #'switch-to-buffer)
  (global-set-key (kbd "C-x C-b") (lambda ()
                                    (interactive)
                                    (with-persp-buffer-list () (ibuffer))))
  (global-set-key (kbd "M-W") #'persp-switch-to-buffer)
  (global-set-key (kbd "C-x k") #'persp-kill-buffer))

