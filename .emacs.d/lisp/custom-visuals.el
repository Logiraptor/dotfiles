;; Minor visual tweaks

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode)
(setq inhibit-splash-screen t)

(use-package all-the-icons)

(use-package doom-themes
  :config
  (load-theme 'doom-spacegrey t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'relative-from-project))




(defun oyarzun/project-tree ()
    "Emulate intellij project-tree hide/show"
    (interactive)
    (if (eq (selected-window) (neo-global--get-window))
        (neotree-hide)
        (neotree-projectile-action)))

(use-package neotree
  :bind (("M-1" . 'oyarzun/project-tree))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))


