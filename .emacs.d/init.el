;; To debug startup time:
;; $ emacs -l ~/.emacs.d/init.el -batch --eval '(message "FINISHED")' 2>&1 | ts '[%Y-%m-%d %H:%M:%.S]' | grep -E 'Loading|FINISHED'
;; This line requires the moreutils package (for ts)


(add-to-list 'load-path "~/.emacs.d/lisp/vendor")

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

(desktop-save-mode 1)

(defun load-custom (name)
  (load (concat "~/.emacs.d/lisp/" name)))

(load-custom "package-meta.el")

(load-custom "custom-navigation.el")
(load-custom "custom-editing.el")
(load-custom "custom-visuals.el")
(load-custom "custom-magit.el")
(load-custom "custom-tramp.el")
(load-custom "custom-helpers.el")
(load-custom "custom-lang-terraform.el")
(load-custom "custom-lang-elisp.el")
(load-custom "custom-lang-yaml.el")


;; TODO: try out dump-jump
