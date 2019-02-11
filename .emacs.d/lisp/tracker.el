

(setq tracker-buffer (generate-new-buffer "*Pivotal Tracker*"))

(use-package request)



(with-output-to-temp-buffer tracker-buffer
  (princ "Pivotal Tracker\n")
  (let* ((resp (request
                "https://www.pivotaltracker.com/services/v5/projects/1422434/stories"
                :headers '(("X-TrackerToken" . "dae0332190014c75fe43dc1145dc81f3"))
                :parser 'buffer-string))
         (data (request-response-data resp))
         (err (request-response-error-thrown resp))
         (status (request-response-status-code resp)))
    (progn
      (princ "\nDATA: ")
      (princ data)
      (princ "\nSTATUS: ")
      (princ status)
      (princ "\nERROR: ")
      (princ err)))
  
  (princ "\nPivotal Tracker\n"))

