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


(add-to-list 'display-buffer-alist
     '("*eshell-panel" (display-buffer-in-side-window) (side . bottom)))
(add-to-list 'display-buffer-alist
     '("*term-panel" (display-buffer-in-side-window) (side . bottom)))


(defun oyarzun/eshell-panel ()
  "Emulate intellij panel hide/show for eshell"
  (interactive)
  (if (ignore-errors eshell-panel-buffer)
      (if (eq (selected-window) (get-buffer-window eshell-panel-buffer))
          (delete-window)
          (pop-to-buffer eshell-panel-buffer))
      (setq eshell-panel-buffer
        (let ((eshell-buffer-name "*eshell-panel*"))
          (eshell)))))

(defun oyarzun/term-panel ()
  "Emulate intellij panel hide/show for eshell"
  (interactive)
  (if (ignore-errors term-panel-buffer)
      (if (eq (selected-window) (get-buffer-window term-panel-buffer))
          (delete-window)
          (pop-to-buffer term-panel-buffer))
      (setq term-panel-buffer
        (ansi-term "/bin/bash" "*term-panel*"))))


(bind-key "M-2" 'oyarzun/eshell-panel)
(bind-key "M-3" 'oyarzun/term-panel)


