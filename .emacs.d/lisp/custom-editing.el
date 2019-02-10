(use-package parinfer
  :bind
  (("C-," . parinfer-toggle-mode))
  :config
  (setq parinfer-extensions '(defaults pretty-parens smart-tab)))
  ;; :mode ("\\.el\\" . parinfer-mode))

(use-package company
  :config
  (global-company-mode)
  :bind  (("C-." . 'company-complete)))

(use-package expand-region
  :config
  :bind  (("M-p" . 'er/expand-region)
          ("M-n" . 'er/contract-region)))

(use-package multiple-cursors
  :config
  :bind  (("M-I" . 'mc/edit-lines)
          ("C->" . 'mc/mark-next-like-this)
          ("C-<" . 'mc/mark-previous-like-this)
          ("C-C C->" . 'mc/mark-all-like-this)))

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
  :bind  (("C-S-n" . 'move-text-down)
          ("C-S-p" . 'move-text-up)))

(use-package wgrep)
