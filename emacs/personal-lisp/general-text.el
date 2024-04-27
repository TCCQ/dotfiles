;; General stuff for editing all text, but particularly prose

;; spelling
(require 'spell-fu)
(setq ispell-personal-dictionary "/home/tmu/.aspell.en.pws")
(add-hook 'text-mode-hook (lambda () (spell-fu-mode 1)))

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
