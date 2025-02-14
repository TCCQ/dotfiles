;; chinese input stuff
;; (require 'unicode-fonts)
;; (unicode-fonts-setup)
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
;; (require 'pyim-wbdict)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
;; (pyim-wbdict-v98-morphe-enable)
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "FangSong" :size 15)))
;; (setq rime-translate-keybindings
;;       '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
;; (setq rime-share-data-dir "~/.local/share/fcitx5/rime")
;; (setq rime-show-candidate 'popup)
