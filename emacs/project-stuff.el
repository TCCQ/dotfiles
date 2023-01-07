(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command 
   (format "gtags %s" dir-name)))

  ;;;  Jonas.Jarnestrom<at>ki.ericsson.se A smarter               
  ;;;  find-tag that automagically reruns etags when it cant find a               
  ;;;  requested item and then makes a new try to locate it.                      
  ;;;  Fri Mar 15 09:52:14 2002  

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.              
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
	ad-do-it
      (error (and (buffer-modified-p)
		  (not (ding))
		  (y-or-n-p "Buffer is modified, save it? ")
		  (save-buffer))
             (er-refresh-tags extension)
             ad-do-it))))

(defun er-refresh-tags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "etags *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently          
    (visit-tags-table default-directory nil)))

(add-hook 'xref-backend-functions 'gxref-xref-backend)

(require 'semantic/sb)
(setq semantic-default-submodes
      '(global-semanticdb-minor-mode global-semantic-idle-scheduler-mode global-semantic-idle-summary-mode global-semantic-idle-completions-mode global-semantic-highlight-func-mode global-semantic-mru-bookmark-mode global-semantic-idle-local-symbol-highlight-mode))
(semantic-mode 1)

(load-file "~/.emacs.d/sr-speedbar.el")
(global-unset-key (kbd "M-i"))
(global-set-key (kbd "M-i") 'sr-speedbar-toggle)
