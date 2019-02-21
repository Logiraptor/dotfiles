(use-package magit
  :bind (("C-x g" . 'magit-status))
  :config
  
  (defun shahid/magit-replace-command (args)
    (message "called with: %S " args)
    (pcase-let ((`(,cmd . ,args) args))
      (cond
       ((string-equal cmd "commit") (cons "ci" args))
       (t (cons cmd args)))))

  (advice-add #'magit-run-git-with-editor
              :filter-args
              #'shahid/magit-replace-command))
