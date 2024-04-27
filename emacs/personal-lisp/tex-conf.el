;; latex stuff
(require 'tex-mode)
(define-key latex-mode-map (kbd "C-c m") (lambda () (interactive)
                                           (push-mark)
                                           (insert "\\[\n\n\\]")
                                           (indent-region (mark) (point))
                                           (pop-mark)
                                           (previous-line)
                                           (indent-for-tab-command)
                                           ))

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
