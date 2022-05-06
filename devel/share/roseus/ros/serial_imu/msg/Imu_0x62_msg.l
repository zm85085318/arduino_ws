;; Auto-generated. Do not edit!


(when (boundp 'serial_imu::Imu_0x62_msg)
  (if (not (find-package "SERIAL_IMU"))
    (make-package "SERIAL_IMU"))
  (shadow 'Imu_0x62_msg (find-package "SERIAL_IMU")))
(unless (find-package "SERIAL_IMU::IMU_0X62_MSG")
  (make-package "SERIAL_IMU::IMU_0X62_MSG"))

(in-package "ROS")
;;//! \htmlinclude Imu_0x62_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass serial_imu::Imu_0x62_msg
  :super ros::object
  :slots (_header _tag _gw_id _node_num _node_data ))

(defmethod serial_imu::Imu_0x62_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tag __tag) 0)
    ((:gw_id __gw_id) 0)
    ((:node_num __node_num) 0)
    ((:node_data __node_data) (let (r) (dotimes (i 16) (push (instance serial_imu::Imu_data_package :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _tag (round __tag))
   (setq _gw_id (round __gw_id))
   (setq _node_num (round __node_num))
   (setq _node_data __node_data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tag
   (&optional __tag)
   (if __tag (setq _tag __tag)) _tag)
  (:gw_id
   (&optional __gw_id)
   (if __gw_id (setq _gw_id __gw_id)) _gw_id)
  (:node_num
   (&optional __node_num)
   (if __node_num (setq _node_num __node_num)) _node_num)
  (:node_data
   (&rest __node_data)
   (if (keywordp (car __node_data))
       (send* _node_data __node_data)
     (progn
       (if __node_data (setq _node_data (car __node_data)))
       _node_data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _tag
    1
    ;; uint8 _gw_id
    1
    ;; uint8 _node_num
    1
    ;; serial_imu/Imu_data_package[16] _node_data
    (apply #'+ (send-all _node_data :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _tag
       (write-byte _tag s)
     ;; uint8 _gw_id
       (write-byte _gw_id s)
     ;; uint8 _node_num
       (write-byte _node_num s)
     ;; serial_imu/Imu_data_package[16] _node_data
     (dolist (elem _node_data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _tag
     (setq _tag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gw_id
     (setq _gw_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _node_num
     (setq _node_num (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; serial_imu/Imu_data_package[16] _node_data
   (dotimes (i 16)
     (send (elt _node_data i) :deserialize buf ptr-) (incf ptr- (send (elt _node_data i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get serial_imu::Imu_0x62_msg :md5sum-) "83afb4dd1d120fe370f84d0e12c2a103")
(setf (get serial_imu::Imu_0x62_msg :datatype-) "serial_imu/Imu_0x62_msg")
(setf (get serial_imu::Imu_0x62_msg :definition-)
      "# 0x62  data_package
Header header
uint8 tag
uint8 gw_id
uint8 node_num
Imu_data_package[16] node_data


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

================================================================================
MSG: serial_imu/Imu_data_package
uint8 tag
uint8 bitmap
uint8 id
float32 prs
uint32 time
uint32 frame_rate
float32 acc_x
float32 acc_y
float32 acc_z
float32 gyr_x
float32 gyr_y
float32 gyr_z
float32 mag_x
float32 mag_y
float32 mag_z
float32 eul_r
float32 eul_p
float32 eul_y
float32 quat_w
float32 quat_x
float32 quat_y
float32 quat_z

")



(provide :serial_imu/Imu_0x62_msg "83afb4dd1d120fe370f84d0e12c2a103")


