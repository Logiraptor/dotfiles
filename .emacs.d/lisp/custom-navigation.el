;; Navigation

(use-package flx)

(use-package smex
  :config
  (smex-initialize))

(use-package counsel
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode)
  (counsel-mode))

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

(use-package swiper
  :config
  (setq swiper-goto-start-of-match t)
  :bind  (("\C-s" . 'swiper)))

