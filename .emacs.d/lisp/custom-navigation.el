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
  :bind (("C-c C-r" . 'ivy-resume))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (setq ivy-initial-inputs-alist nil)
  (ivy-mode)
  (counsel-mode))

(use-package projectile
  :delight '(:eval (concat " ~:" (projectile-project-name)))
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-enable-caching t)
  (setq projectile-use-git-grep t)
  (setq projectile-project-search-path '("~/workspace" "~/dev/src/github.com/Logiraptor"))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :chords (("pk" . projectile-command-map)))

(use-package swiper
  :config
  (setq swiper-goto-start-of-match t)
  :bind  (("\C-s" . 'swiper)))

