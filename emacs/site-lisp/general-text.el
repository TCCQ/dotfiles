;; General stuff for editing all text, but particularly prose

(provide 'general-text)

;; dictionaries
(define-prefix-command 'dict-map)
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

(setq ispell-personal-dictionary "/home/tmu/.aspell.en.pws")
(add-hook 'text-mode-hook (lambda ()
                            (ispell-mode 1)
                            (local-set-key (kbd "M-l") 'dict-map)))

(electric-pair-mode 1)

(use-package dabbrev
  :config
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))
