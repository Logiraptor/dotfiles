
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
(load-custom "custom-lang-terraform.el")
(load-custom "custom-helpers.el")



;; TODO: Consider 'copy line when no selection' http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html
;; TODO: get smarter scroll behavior from wolfe's literate config
