; Auto-generated. Do not edit!


(cl:in-package dockingrobot-msg)


;//! \htmlinclude Docking.msg.html

(cl:defclass <Docking> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type cl:integer
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:integer
    :initform 0))
)

(cl:defclass Docking (<Docking>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Docking>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Docking)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dockingrobot-msg:<Docking> is deprecated: use dockingrobot-msg:Docking instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <Docking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dockingrobot-msg:left-val is deprecated.  Use dockingrobot-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <Docking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dockingrobot-msg:right-val is deprecated.  Use dockingrobot-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Docking>) ostream)
  "Serializes a message object of type '<Docking>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'left)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'right)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'right)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Docking>) istream)
  "Deserializes a message object of type '<Docking>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'left)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'right)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'right)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Docking>)))
  "Returns string type for a message object of type '<Docking>"
  "dockingrobot/Docking")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Docking)))
  "Returns string type for a message object of type 'Docking"
  "dockingrobot/Docking")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Docking>)))
  "Returns md5sum for a message object of type '<Docking>"
  "5d174ad098f607428d0ec6461248ca61")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Docking)))
  "Returns md5sum for a message object of type 'Docking"
  "5d174ad098f607428d0ec6461248ca61")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Docking>)))
  "Returns full string definition for message of type '<Docking>"
  (cl:format cl:nil "uint32 left~%uint32 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Docking)))
  "Returns full string definition for message of type 'Docking"
  (cl:format cl:nil "uint32 left~%uint32 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Docking>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Docking>))
  "Converts a ROS message object to a list"
  (cl:list 'Docking
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
