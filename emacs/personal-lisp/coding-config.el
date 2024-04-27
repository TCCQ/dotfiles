;; Various config specifically for programming

(add-hook 'xref-backend-functions 'gxref-xref-backend)

;; better commenting binds
(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x ;") 'comment-line)
(global-set-key (kbd "C-x :") 'comment-set-column) ;never gonna use but whatever

(setq asm-comment-char ?#) ; prefer # over ; for asm comments

;; generate tags for label names in asm files, based on asm files in the current directory
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

;; Find defs in various ways
(global-set-key (kbd "M-i") 'imenu)
(global-set-key (kbd "M-I") 'xref-find-definitions)


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

;; various folding types and binds
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
(global-set-key (kbd "C-c /") 'hide-lines)
(autoload 'fold-this "fold-this" "arbitrary folding" t)
(autoload 'fold-this-unfold-at-point "fold-this" "arbitrary folding" t)
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

;; global prog stuff that differs from global/text
(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode 1)
                            ;; (flymake-mode 1)
                            (spell-fu-mode 0)
                            (superword-mode 1)
                            (whitespace-mode 1)
                            (modify-syntax-entry ?_ "w") )
                            (display-fill-column-indicator-mode 1)
                            (add-hook 'before-save-hook
                                      (lambda ()
                                        (if (not (eq major-mode 'makefile-gmake-mode))
                                            (clean-prog-file (current-buffer))))))

;; haskell flavor and tags
(setq haskell-tags-on-save t)
(add-hook 'haskell-mode-hook (lambda ()
                               (hindent 1)
                               (interactive-haskell-mode 1)
                               (eldoc-mode 1)))
(setq haskell-process-type 'cabal-repl)

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

(add-hook 'vterm-mode-hook (lambda () (hl-line-mode 0)))
(add-hook 'eshell-mode-hook (lambda () (hl-line-mode 0)))

(define-key vterm-mode-map (kbd "M-W") 'persp-switch-to-buffer)
(define-key vterm-mode-map (kbd "M-k") 'persp-kill-buffer)
(define-key vterm-mode-map (kbd "M-p") 'persp-key-map)

(define-key eshell-mode-map (kbd "M-o") 'other-window)
(define-key eshell-mode-map (kbd "M-W") 'switch-buffer)
(define-key eshell-mode-map (kbd "C-l") (lambda () (interactive) (recenter-top-bottom 0)))

;; scuffed compilation binds and prefs
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
(persp-mode 1)

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

