
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
(evil-set-initial-state 'vterm-mode 'emacs)
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
(define-key evil-normal-state-map (kbd "M-Z") 'suspend-frame)

;;; sasha bindings
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
