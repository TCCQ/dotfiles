;;; Various functions functions that are not part of an external package

(provide 'my-funcs)


;; see transparancy in init.el
(defun toggle-frame-transparency ()
  "Toggle transparency."
  (interactive)
  (let ((alpha-transparency 90))
    (if (eq alpha-transparency (frame-parameter nil 'alpha-background))
        (set-frame-parameter nil 'alpha-background 100)
      (set-frame-parameter nil 'alpha-background alpha-transparency))))

(defun wrap-region-paren ()
  "Wraps the region in parens.
Similar to pressing ( with the region active."
  (interactive)
  (let ((beg (region-beginning))
        (end (region-end)))
    (save-excursion
      (goto-char beg)
      (insert "(")
      (goto-char (+ end 1))
      (insert ")")
      )))

(defun zap-whitespace ()
  "zaps the whitespace around the point in both directions"
  (interactive)
  (push-mark)
  (skip-chars-backward " \t\n")
  (push-mark)
  (skip-chars-forward " \t\n")
  (delete-region (mark) (point))
  (pop-mark)
  (goto-char (mark))
  (pop-mark))

(defun wrap-sexp (&optional arg)
  "Wraps the following sexp in a pair of parens.
Places inside the new pair, with prefix arg do the same backwards, pushing the
mark.  Does the same of ARG number sexps if given"
  (interactive "p")
  (message "%s" arg)
  (if arg
      (progn
        (push-mark)
        (insert-pair arg ?\( ?\)))
    (insert-pair 1 ?\( ?\))))

(defun close-or-kill ()
  "If this is the sole frame, kill emacs. Otherwise close the frame."
  (interactive)
  (if (eq 1 (length (frame-list)))
      ;; sole frame, exit
      (save-buffers-kill-terminal)
    (delete-frame)))

;; indent code when pasting, from
;; https://trey-jackson.blogspot.com/2008/03/emacs-tip-15-indent-yanked-code.html

;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(emacs-lisp-mode
                            c-mode c++-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode
                            rust-mode
                            rustic-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large.
BEG and END define the region."
  (indent-region beg end nil))

(defadvice yank (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice evil-paste-before (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice evil-paste-after (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defun fold-this-fold-forward (&optional arg)
  "Fold forward ARG number of sexps, defaulting to one."
  (interactive "p")
  (push-mark)
  (forward-sexp arg)
  (fold-this (mark) (point))
  (pop-mark))

(defun fold-this-fold-backward (&optional arg)
  "Fold backward ARG number of sexps, defaulting to one."
  (interactive "p")
  (push-mark)
  (backward-sexp arg)
  (fold-this (point) (mark))
  (pop-mark))

(defun clean-prog-file (buffer)
  "Fixes whitespace in buffer"
  (save-excursion
    (with-current-buffer buffer
      (untabify (point-min) (point-max))
      (goto-char (point-min))
      (while (re-search-forward " +$" nil t)
        (replace-match "" nil nil)))))

(defun open-window-by-buffer (buffer)
  "Move focus to an extant window by the buffer it contains."
  (interactive "bBuffer: ")
  (let ((win (get-buffer-window buffer t)))
    (if win
        (select-window win)
      (switch-to-buffer buffer))))

(defun dired-do-find-marked-files ()
  (interactive)
  (seq-do 'find-file (dired-get-marked-files)))
