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
  (setq doom-modeline-buffer-file-name-style 'file-name))


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


(add-to-list 'display-buffer-alist
     '("*eshell-panel" (display-buffer-in-side-window) (side . bottom)))

(add-to-list 'display-buffer-alist
     '("*open-files" (display-buffer-in-side-window) (side . bottom)))

(defun oyarzun/define-panel (name panel-ctor options)
   (let ((buf (get-buffer name)))
      (if buf
          (if (eq (selected-window) (get-buffer-window buf))
              (delete-window)
              (pop-to-buffer buf))
          (progn
            (save-window-excursion
              (funcall panel-ctor)
              (display-buffer-in-side-window (current-buffer) options)
              (rename-buffer name))
            (pop-to-buffer name)))))

;; TODO: this should stay up to date as buffer lists changes
(defun oyarzun/open-file-panel ()
  "Emulate intellij panel hide/show for open files"
  (interactive)
  (oyarzun/define-panel "*open-files*" (lambda () (buffer-menu) (Buffer-menu-toggle-files-only 1)) '((side . bottom) (slot . 1))))

(bind-key "M-3" 'oyarzun/open-file-panel)

(defun oyarzun/eshell-panel ()
  "Emulate intellij panel hide/show for eshell"
  (interactive)
  (oyarzun/define-panel "*eshell-panel*" (lambda () (let ((eshell-buffer-name "*eshell-panel*")) (eshell))) '((side . bottom) (slot . -1))))

(bind-key "M-2" 'oyarzun/eshell-panel)

(show-paren-mode)

;; TODO: Split side windows into more modular panels
