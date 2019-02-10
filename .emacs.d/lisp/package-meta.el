;; Package Configuration

(require 'package)

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(defmacro lazy-lang (hook &rest body)
  "Register code to run when a major mode is activated"
  (list 'add-hook (list 'quote hook)
    (cons 'lambda (cons () body))))


(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))
