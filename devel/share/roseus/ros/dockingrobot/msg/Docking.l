;; Auto-generated. Do not edit!


(when (boundp 'dockingrobot::Docking)
  (if (not (find-package "DOCKINGROBOT"))
    (make-package "DOCKINGROBOT"))
  (shadow 'Docking (find-package "DOCKINGROBOT")))
(unless (find-package "DOCKINGROBOT::DOCKING")
  (make-package "DOCKINGROBOT::DOCKING"))

(in-package "ROS")
;;//! \htmlinclude Docking.msg.html


(defclass dockingrobot::Docking
  :super ros::object
  :slots (_left _right ))

(defmethod dockingrobot::Docking
  (:init
   (&key
    ((:left __left) 0)
    ((:right __right) 0)
    )
   (send-super :init)
   (setq _left (round __left))
   (setq _right (round __right))
   self)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:serialization-length
   ()
   (+
    ;; uint32 _left
    4
    ;; uint32 _right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _left
       (write-long _left s)
     ;; uint32 _right
       (write-long _right s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _left
     (setq _left (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _right
     (setq _right (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get dockingrobot::Docking :md5sum-) "5d174ad098f607428d0ec6461248ca61")
(setf (get dockingrobot::Docking :datatype-) "dockingrobot/Docking")
(setf (get dockingrobot::Docking :definition-)
      "uint32 left
uint32 right

")



(provide :dockingrobot/Docking "5d174ad098f607428d0ec6461248ca61")


