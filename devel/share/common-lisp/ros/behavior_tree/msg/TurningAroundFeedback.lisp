; Auto-generated. Do not edit!


(cl:in-package behavior_tree-msg)


;//! \htmlinclude TurningAroundFeedback.msg.html

(cl:defclass <TurningAroundFeedback> (roslisp-msg-protocol:ros-message)
  ((rotation_status
    :reader rotation_status
    :initarg :rotation_status
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurningAroundFeedback (<TurningAroundFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurningAroundFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurningAroundFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name behavior_tree-msg:<TurningAroundFeedback> is deprecated: use behavior_tree-msg:TurningAroundFeedback instead.")))

(cl:ensure-generic-function 'rotation_status-val :lambda-list '(m))
(cl:defmethod rotation_status-val ((m <TurningAroundFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader behavior_tree-msg:rotation_status-val is deprecated.  Use behavior_tree-msg:rotation_status instead.")
  (rotation_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurningAroundFeedback>) ostream)
  "Serializes a message object of type '<TurningAroundFeedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rotation_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurningAroundFeedback>) istream)
  "Deserializes a message object of type '<TurningAroundFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotation_status) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurningAroundFeedback>)))
  "Returns string type for a message object of type '<TurningAroundFeedback>"
  "behavior_tree/TurningAroundFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurningAroundFeedback)))
  "Returns string type for a message object of type 'TurningAroundFeedback"
  "behavior_tree/TurningAroundFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurningAroundFeedback>)))
  "Returns md5sum for a message object of type '<TurningAroundFeedback>"
  "8d86daa292f3a880c6162663bc037e95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurningAroundFeedback)))
  "Returns md5sum for a message object of type 'TurningAroundFeedback"
  "8d86daa292f3a880c6162663bc037e95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurningAroundFeedback>)))
  "Returns full string definition for message of type '<TurningAroundFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%float32 rotation_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurningAroundFeedback)))
  "Returns full string definition for message of type 'TurningAroundFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%float32 rotation_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurningAroundFeedback>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurningAroundFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'TurningAroundFeedback
    (cl:cons ':rotation_status (rotation_status msg))
))
