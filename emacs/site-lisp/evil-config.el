;;; evil config
(provide 'evil-config)

(use-package evil
  :custom
  (evil-want-keybinding nil)
  (evil-want-integration t)
  :init
  (evil-mode 1))
(use-package evil-collection
  :init
  (evil-collection-init))
(use-package evil-easymotion
  :init
  (evilem-default-keybindings "SPC"))
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
(use-package evil-snipe
  :config
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1)
  (evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
  (evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)
  :custom
  (evil-snipe-scope 'buffer))
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
(define-key evil-normal-state-map (kbd "M-Z") 'suspend-frame)

(define-key evil-motion-state-map (kbd "TAB") 'indent-for-tab-command)
(evil-set-initial-state 'vterm-mode 'emacs)

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

(define-key evil-insert-state-map (kbd "C-t") 'transpose-chars)
(define-key evil-normal-state-map (kbd "C-t") 'transpose-chars)
(evil-define-key 'normal global-map (kbd "SPC i") 'imenu)
(evil-define-key 'normal global-map (kbd "SPC o") 'other-window)
(evil-define-key 'normal global-map (kbd "SPC q") 'kill-current-buffer)
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
(evil-define-key 'normal global-map (kbd "M-h") 'evil-window-left)
(evil-define-key 'normal global-map (kbd "M-j") 'evil-window-down)
(evil-define-key 'normal global-map (kbd "M-k") 'evil-window-up)
(evil-define-key 'normal global-map (kbd "M-l") 'evil-window-right)
(evil-define-key 'normal global-map (kbd "SPC SPC w") 'delete-window)
(evil-define-key 'normal global-map (kbd "SPC SPC q") 'delete-window)
(evil-define-key 'normal global-map (kbd "SPC SPC b") 'balance-windows)
(evil-define-key 'normal global-map (kbd "SPC s s") 'save-buffer)
(evil-define-key 'normal global-map (kbd "SPC s f")  'counsel-find-file)
(evil-define-key 'normal global-map (kbd "SPC s r")  'counsel-rg)
(evil-define-key 'normal global-map (kbd "SPC ;") 'frog-jump-buffer)
