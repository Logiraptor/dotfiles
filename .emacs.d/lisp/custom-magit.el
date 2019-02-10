(use-package magit
  :bind (("C-x g" . 'magit-status))
  :config
  ;; Add git ci support (from https://github.com/jvshahid/emacs-config/blob/7d777f5a6d8da3af119ac1228b0b6cf34ba33aba/emacs.d/lisp/conf-magit.el#L10-L28)

  (magit-define-popup-action 'magit-commit-popup ?i "Commit using ci" 'magit-ci-create ?c t)

  (defun magit-ci-create (&optional args)
    "Create a new commit on `HEAD' using `ci'.)
With a prefix argument, amend to the commit at `HEAD' instead.
\n(git commit [--amend] ARGS)"
    (interactive
     (if current-prefix-arg
       (list (cons "--amend" (magit-commit-arguments)))
       (list (magit-commit-arguments))))
    (when (member "--all" args)
      (setq this-command 'magit-commit-all))
    (when (setq args (magit-commit-assert args))
      (let ((default-directory (magit-toplevel)))
        (magit-run-git-with-editor "ci" args)))))
