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



