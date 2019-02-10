

(lazy-lang emacs-lisp-mode-hook
  (use-package parinfer
    :bind (("C-," . parinfer-toggle-mode))
    :config
    (setq parinfer-extensions '(defaults pretty-parens smart-tab))
    (parinfer-mode)))

