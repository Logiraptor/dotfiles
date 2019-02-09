;; Config from: https://melpa.org/#/getting-started

(require 'package)

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(package-initialize)

;; Customize

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(ns-alternate-modifier (quote super))
 '(ns-command-modifier (quote meta))
 '(package-selected-packages
   (quote
    (parinfer parinfer-mode move-text flx counsel ido-vertical-mode smex flx-ido expand-region multiple-cursors company-terraform terraform-mode company swiper wgrep ag projectile magit use-package)))
 '(swiper-goto-start-of-match t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :family "Fira Code")))))

;; Config adapted from: https://github.com/jwiegley/use-package

(require 'use-package)

;; Auto-download missing packages
(setq use-package-always-ensure t)

;; Turn off splash screen

(setq inhibit-splash-screen t)

;; Turn off toolbar

(tool-bar-mode -1)

;; Turn on line numbers

(global-linum-mode)

;; Turn on '(i)nteractive-do' stuff
;; From: https://www.masteringemacs.org/article/introduction-to-ido-mode
;; (use-package flx-ido
;; :config
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; (setq ido-enable-flex-matching t))

;; Add to remote path in TRAMP from (https://github.com/jvshahid/emacs-config/blob/7d777f5a6d8da3af119ac1228b0b6cf34ba33aba/emacs.d/lisp/conf-tramp.el#L3-L5)

(with-eval-after-load 'tramp
  ;;  (push "~/.fzf/bin" tramp-remote-path)
  (push "~/bin" tramp-remote-path))

;; Package declarations

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

;; (use-package ido-vertical-mode
;;   :config
;;   (ido-vertical-mode 1)
;;   (setq ido-vertical-define-keys 'C-n-and-C-p-only)
;;   (setq ido-use-faces t)
;;   (set-face-attribute 'ido-vertical-first-match-face nil
;;                     :background (face-attribute 'highlight :background)
;;                     :foreground (face-attribute 'highlight :foreground)))

(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  ;; Add git ci support (from https://github.com/jvshahid/emacs-config/blob/7d777f5a6d8da3af119ac1228b0b6cf34ba33aba/emacs.d/lisp/conf-magit.el#L10-L28)

  (add-hook 'magit-mode-hook '(lambda ())
      (setq show-trailing-whitespace nil))
  (setq
   auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffers-p)
  (magit-define-popup-action 'magit-commit-popup ?i "Commit using ci" 'magit-ci-create ?c t)

  (defun magit-ci-create (&optional args)
    "Create a new commit on `HEAD' using `ci'.))
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

(use-package parinfer
  :bind
  (("C-," . parinfer-toggle-mode))
  :config
  (setq parinfer-extensions '(defaults pretty-parens smart-tab)))

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-enable-caching t)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

(use-package company
  :config
  (global-company-mode)
  (global-set-key (kbd "C-.") 'company-complete))

(use-package terraform-mode)

(use-package company-terraform)

(use-package ag)

(use-package wgrep)

(use-package swiper
  :config
  (setq swiper-goto-start-of-match t)
  (global-set-key "\C-s" 'swiper))

(use-package expand-region
  :config
  (global-set-key (kbd "M-p") 'er/expand-region)
  (global-set-key (kbd "M-n") 'er/contract-region))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "M-I") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-C C->") 'mc/mark-all-like-this))



;; Useful functions

(defun oyarzun/duplicate-line ()
  (interactive)
  (let ((col (current-column)))
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (newline)
    (yank)
    (move-to-column col)))

(global-set-key (kbd "C-S-d") 'oyarzun/duplicate-line)

(use-package move-text
  :config        ;TODO: make it expand the region to the full line (shahid says advice is a thing)
  (global-set-key (kbd "C-S-n") 'move-text-down)
  (global-set-key (kbd "C-S-p") 'move-text-up))


(scroll-bar-mode -1)



