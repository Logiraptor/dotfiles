
(use-package company
  :config
  (use-package company-flx
    :config
    (company-flx-mode))
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

(bind-key "C-S-d" 'oyarzun/duplicate-line)

(require 'move-lines)

(with-eval-after-load 'move-lines
  (bind-key "C-S-n" 'move-lines-down)
  (bind-key "C-S-p" 'move-lines-up))

(use-package wgrep)

(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)))



(defun toggle-indent-longer-lines (&optional delta)
  "Trigger selective display to hide lines that have more indentation than the current line. \
If DELTA was provided it will be added to the current line's indentation."
  (interactive "P")
  (let ((indentation (current-indentation)))
    (if selective-display
        (set-selective-display nil)
        (set-selective-display (+ indentation 1
                                  (if delta delta 0))))))
(global-set-key (kbd "C-x t") 'toggle-indent-longer-lines)


(delete-selection-mode)
