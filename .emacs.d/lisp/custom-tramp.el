;; Add to remote path in TRAMP

(with-eval-after-load 'tramp
  (push "~/bin" tramp-remote-path))
