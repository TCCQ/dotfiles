;;; Modeline config

(provide 'modeline-config)

(require 'battery)
(display-battery-mode 1)

(use-package doom-modeline
  :init
  (doom-modeline-mode 1))
(use-package minions
  :init
  (minions-mode 1)
  :custom
  (minions-prominent-modes '(persp-mode auto-fill-mode eldoc-mode eglot-mode lsp-mode)))

(require 'time)
(setq display-time-day-and-date t)
;; Set up the time timer.
(defun enable-display-time-backend ()
  "Do the internal bit of `display-time-mode` but without adding it to the
global mode string"
  (and display-time-timer (cancel-timer display-time-timer))
  (setq display-time-timer nil)
  (setq display-time-string "")
  (setq display-time-load-average display-time-default-load-average)
  (progn
    ;; (or (memq 'display-time-string global-mode-string)
    ;;     (setq global-mode-string
    ;;           (append global-mode-string '(display-time-string))))
    ;; Set up the time timer.
    (setq display-time-timer
          (run-at-time t display-time-interval
                       'display-time-event-handler))
    ;; Make the time appear right away.
    (display-time-update)))

;; (enable-display-time-backend)
(display-time-mode 1)
;; there is more in the single-header file

;; -----------------------------------------------------------------------------
;; telephone line stuff

;; (setq telephone-line-primary-left-separator 'telephone-line-tan-left)
;; (setq telephone-line-primary-right-separator 'telephone-line-tan-right)

;; (telephone-line-defsegment* telephone-line-time-segment ()
;;   (telephone-line-raw display-time-string t))

;; (setq telephone-line-lhs
;;       '((evil   . (telephone-line-evil-tag-segment))
;;         (accent . (telephone-line-vc-segment
;;                    telephone-line-erc-modified-channels-segment
;;                    telephone-line-process-segment))
;;         (nil    . (telephone-line-buffer-segment
;;                    telephone-line-minions-mode-segment))))
;; (setq telephone-line-rhs
;;       '((nil    . (telephone-line-misc-info-segment))
;;         (accent . (telephone-line-time-segment))
;;         (evil   . (telephone-line-airline-position-segment))))

;; (telephone-line-mode 1)
