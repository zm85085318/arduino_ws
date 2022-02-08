;; Auto-generated. Do not edit!


(when (boundp 'behavior_tree::Analog)
  (if (not (find-package "BEHAVIOR_TREE"))
    (make-package "BEHAVIOR_TREE"))
  (shadow 'Analog (find-package "BEHAVIOR_TREE")))
(unless (find-package "BEHAVIOR_TREE::ANALOG")
  (make-package "BEHAVIOR_TREE::ANALOG"))

(in-package "ROS")
;;//! \htmlinclude Analog.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass behavior_tree::Analog
  :super ros::object
  :slots (_header _value ))

(defmethod behavior_tree::Analog
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _value (round __value))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _value
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _value
       (write-word _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _value
     (setq _value (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get behavior_tree::Analog :md5sum-) "5760aa9c40c2caa52a04d293094e679d")
(setf (get behavior_tree::Analog :datatype-) "behavior_tree/Analog")
(setf (get behavior_tree::Analog :definition-)
      "# Reading from a single analog IO pin.
Header header
uint16 value
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :behavior_tree/Analog "5760aa9c40c2caa52a04d293094e679d")


