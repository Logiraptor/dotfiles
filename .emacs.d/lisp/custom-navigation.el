;; Scroll Behavior

(setq scroll-margin 10
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Navigation Packages

(use-package flx)

(use-package smex
  :config
  (smex-initialize))

(use-package counsel
  :diminish
  :config
  (diminish 'ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode)
  (counsel-mode))

(use-package projectile
  :delight '(:eval (concat " ~:" (projectile-project-name)))
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
