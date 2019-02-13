(use-package request)
(use-package json-mode)


(defun printf (message &rest args)
  (princ (apply 'format message args)))

(defun render-header ()
  (printf "Pivotal Tracker: \n\n"))

(defun render-footer ()
  (princ "\n---------------------"))

(defun render-story (story)
  (printf "#%s %s" (alist-get 'id story) (alist-get 'name story))
  (princ "\n\n")
  (princ (alist-get 'description story))
  (princ "\n\n\n"))

(defun render-story-list (data)
  (with-output-to-temp-buffer (get-buffer-create "*Pivotal Tracker*")
    (render-header)
    (mapc 'render-story data)
    (render-footer)))



(request
  "https://www.pivotaltracker.com/services/v5/projects/1422434/stories"
  :headers '(("X-TrackerToken" . pivotal-tracker-token))
  :parser 'json-read
  :success
  (cl-function
    (lambda (&key data &allow-other-keys)
      (when data
        (render-story-list data)))))



