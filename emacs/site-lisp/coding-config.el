;;; The config specifically for editing code

(provide 'coding-config)

;; (add-hook 'xref-backend-functions 'gxref-xref-backend)

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

(use-package lsp-mode)

(use-package lsp-haskell)

(use-package sideline
  :init
  (setq sideline-backends-right '()))
(use-package sideline-flycheck
  :init
  (push 'sideline-flycheck sideline-backends-right))
(use-package sideline-flymake
  :init
  (push 'sideline-flymake sideline-backends-right))
(use-package sideline-lsp
  :init
  (push 'sideline-lsp sideline-backends-right))

(use-package flycheck
  :config
  ;; flymake stuff to be less annoying
  ;; (face-spec-set 'flycheck-note '((t :underline nil)))
  ;; (face-spec-set 'flycheck-info '((t :underline nil)))
  ;; (face-spec-set 'flycheck-warning '((t :underline nil)))
  ;; (face-spec-set 'flycheck-error '((t :underline nil)))
  (add-hook 'prog-mode-hook (lambda () flycheck-mode 1)))

;; Find defs in various ways
(global-set-key (kbd "M-i") 'imenu)
(global-set-key (kbd "M-I") 'xref-find-definitions)

(setq imenu-auto-rescan t)

;; make ibuffer play with projectile
(use-package ibuffer
  :bind
  ("C-x C-b" . ibuffer)
  :hook
  (ibuffer . (lambda ()
               (ibuffer-projectile-set-filter-groups)
               (unless (eq ibuffer-sorting-mode 'alphabetic)
                 (ibuffer-do-sort-by-alphabetic)))))

;; make shells and whatnot slightly better
(require 'comint)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; various folding types and binds
;;(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
;;(global-set-key (kbd "C-c /") 'hide-lines)
(use-package fold-this
  :init
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
    (kbd "l") 'hs-hide-level))

;; global prog stuff that differs from global/text
(require 'my-funcs)
(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode 1)
                            (superword-mode 1)
                            (modify-syntax-entry ?_ "w") )
          (display-fill-column-indicator-mode 1)
          (add-hook 'before-save-hook
                    (lambda ()
                      (if (not (eq major-mode 'makefile-gmake-mode))
                          (clean-prog-file (current-buffer))))))

;; haskell flavor and tags
(use-package haskell-mode
  :custom
  (haskell-tags-on-save t)
  (haskell-process-type 'cabal-repl)
  :hook
  (haskell-mode . (lambda ()
                    ;; (hindent-mode 1)
                    (interactive-haskell-mode 1))))

(global-set-key (kbd "M-m") 'goto-next-locus)
(global-set-key (kbd "M-M") 'recompile)
(setq compilation-always-kill t
      compilation-scroll-output t)
;; Allow compilation buffer to be dedicated across frames
(push '("\\*compilation\\*" . (nil (reusable-frames . t))) display-buffer-alist)

;; better searching
(require 'counsel)
(setq counsel-grep-base-command
      "rg -i -M 120 --no-heading --line-number --color never '%s' %s")
(global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
(global-set-key (kbd "C-S-s") 'isearch-forward)
