; Auto-generated. Do not edit!


(cl:in-package serial_imu-msg)


;//! \htmlinclude Imu_0x62_msg.msg.html

(cl:defclass <Imu_0x62_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tag
    :reader tag
    :initarg :tag
    :type cl:fixnum
    :initform 0)
   (gw_id
    :reader gw_id
    :initarg :gw_id
    :type cl:fixnum
    :initform 0)
   (node_num
    :reader node_num
    :initarg :node_num
    :type cl:fixnum
    :initform 0)
   (node_data
    :reader node_data
    :initarg :node_data
    :type (cl:vector serial_imu-msg:Imu_data_package)
   :initform (cl:make-array 16 :element-type 'serial_imu-msg:Imu_data_package :initial-element (cl:make-instance 'serial_imu-msg:Imu_data_package))))
)

(cl:defclass Imu_0x62_msg (<Imu_0x62_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Imu_0x62_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Imu_0x62_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_imu-msg:<Imu_0x62_msg> is deprecated: use serial_imu-msg:Imu_0x62_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Imu_0x62_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_imu-msg:header-val is deprecated.  Use serial_imu-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tag-val :lambda-list '(m))
(cl:defmethod tag-val ((m <Imu_0x62_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_imu-msg:tag-val is deprecated.  Use serial_imu-msg:tag instead.")
  (tag m))

(cl:ensure-generic-function 'gw_id-val :lambda-list '(m))
(cl:defmethod gw_id-val ((m <Imu_0x62_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_imu-msg:gw_id-val is deprecated.  Use serial_imu-msg:gw_id instead.")
  (gw_id m))

(cl:ensure-generic-function 'node_num-val :lambda-list '(m))
(cl:defmethod node_num-val ((m <Imu_0x62_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_imu-msg:node_num-val is deprecated.  Use serial_imu-msg:node_num instead.")
  (node_num m))

(cl:ensure-generic-function 'node_data-val :lambda-list '(m))
(cl:defmethod node_data-val ((m <Imu_0x62_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_imu-msg:node_data-val is deprecated.  Use serial_imu-msg:node_data instead.")
  (node_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Imu_0x62_msg>) ostream)
  "Serializes a message object of type '<Imu_0x62_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gw_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_num)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'node_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Imu_0x62_msg>) istream)
  "Deserializes a message object of type '<Imu_0x62_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gw_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_num)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'node_data) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'node_data)))
    (cl:dotimes (i 16)
    (cl:setf (cl:aref vals i) (cl:make-instance 'serial_imu-msg:Imu_data_package))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Imu_0x62_msg>)))
  "Returns string type for a message object of type '<Imu_0x62_msg>"
  "serial_imu/Imu_0x62_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Imu_0x62_msg)))
  "Returns string type for a message object of type 'Imu_0x62_msg"
  "serial_imu/Imu_0x62_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Imu_0x62_msg>)))
  "Returns md5sum for a message object of type '<Imu_0x62_msg>"
  "83afb4dd1d120fe370f84d0e12c2a103")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Imu_0x62_msg)))
  "Returns md5sum for a message object of type 'Imu_0x62_msg"
  "83afb4dd1d120fe370f84d0e12c2a103")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Imu_0x62_msg>)))
  "Returns full string definition for message of type '<Imu_0x62_msg>"
  (cl:format cl:nil "# 0x62  data_package~%Header header~%uint8 tag~%uint8 gw_id~%uint8 node_num~%Imu_data_package[16] node_data~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: serial_imu/Imu_data_package~%uint8 tag~%uint8 bitmap~%uint8 id~%float32 prs~%uint32 time~%uint32 frame_rate~%float32 acc_x~%float32 acc_y~%float32 acc_z~%float32 gyr_x~%float32 gyr_y~%float32 gyr_z~%float32 mag_x~%float32 mag_y~%float32 mag_z~%float32 eul_r~%float32 eul_p~%float32 eul_y~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Imu_0x62_msg)))
  "Returns full string definition for message of type 'Imu_0x62_msg"
  (cl:format cl:nil "# 0x62  data_package~%Header header~%uint8 tag~%uint8 gw_id~%uint8 node_num~%Imu_data_package[16] node_data~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: serial_imu/Imu_data_package~%uint8 tag~%uint8 bitmap~%uint8 id~%float32 prs~%uint32 time~%uint32 frame_rate~%float32 acc_x~%float32 acc_y~%float32 acc_z~%float32 gyr_x~%float32 gyr_y~%float32 gyr_z~%float32 mag_x~%float32 mag_y~%float32 mag_z~%float32 eul_r~%float32 eul_p~%float32 eul_y~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Imu_0x62_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'node_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Imu_0x62_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'Imu_0x62_msg
    (cl:cons ':header (header msg))
    (cl:cons ':tag (tag msg))
    (cl:cons ':gw_id (gw_id msg))
    (cl:cons ':node_num (node_num msg))
    (cl:cons ':node_data (node_data msg))
))
