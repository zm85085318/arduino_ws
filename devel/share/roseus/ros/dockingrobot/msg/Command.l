;; Auto-generated. Do not edit!


(when (boundp 'dockingrobot::Command)
  (if (not (find-package "DOCKINGROBOT"))
    (make-package "DOCKINGROBOT"))
  (shadow 'Command (find-package "DOCKINGROBOT")))
(unless (find-package "DOCKINGROBOT::COMMAND")
  (make-package "DOCKINGROBOT::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude Command.msg.html


(defclass dockingrobot::Command
  :super ros::object
  :slots (_command ))

(defmethod dockingrobot::Command
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get dockingrobot::Command :md5sum-) "cba5e21e920a3a2b7b375cb65b64cdea")
(setf (get dockingrobot::Command :datatype-) "dockingrobot/Command")
(setf (get dockingrobot::Command :definition-)
      "string command
")



(provide :dockingrobot/Command "cba5e21e920a3a2b7b375cb65b64cdea")


