;;; Various custom binds that aren't part of an external package

(provide 'my-binds)
(require 'my-funcs)

(global-set-key (kbd "C-x C-C") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'close-or-kill)
(global-set-key (kbd "M-w") 'copy-region-as-kill) ;;make copying not flash cursor
(global-set-key (kbd "M-(") 'wrap-region-paren)
(global-set-key (kbd "M-z") 'zap-whitespace)
(global-set-key (kbd "C-M-z") 'wrap-sexp)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-c") 'calc)
(global-set-key (kbd "M-U") 'scroll-lock-mode)
(global-set-key (kbd "M-Q") 'auto-fill-mode)
(require 'dired)
(keymap-set dired-mode-map "C-o" 'dired-display-file)
(keymap-set dired-mode-map "F" 'dired-do-find-marked-files)


(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-h") 'backward-char)
