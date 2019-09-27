; Auto-generated. Do not edit!


(cl:in-package experiment-srv)


;//! \htmlinclude SimpleMovement-request.msg.html

(cl:defclass <SimpleMovement-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SimpleMovement-request (<SimpleMovement-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimpleMovement-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimpleMovement-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name experiment-srv:<SimpleMovement-request> is deprecated: use experiment-srv:SimpleMovement-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimpleMovement-request>) ostream)
  "Serializes a message object of type '<SimpleMovement-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimpleMovement-request>) istream)
  "Deserializes a message object of type '<SimpleMovement-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimpleMovement-request>)))
  "Returns string type for a service object of type '<SimpleMovement-request>"
  "experiment/SimpleMovementRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleMovement-request)))
  "Returns string type for a service object of type 'SimpleMovement-request"
  "experiment/SimpleMovementRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimpleMovement-request>)))
  "Returns md5sum for a message object of type '<SimpleMovement-request>"
  "4fe5af303955c287688e7347e9b00278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimpleMovement-request)))
  "Returns md5sum for a message object of type 'SimpleMovement-request"
  "4fe5af303955c287688e7347e9b00278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimpleMovement-request>)))
  "Returns full string definition for message of type '<SimpleMovement-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimpleMovement-request)))
  "Returns full string definition for message of type 'SimpleMovement-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimpleMovement-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimpleMovement-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SimpleMovement-request
))
;//! \htmlinclude SimpleMovement-response.msg.html

(cl:defclass <SimpleMovement-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass SimpleMovement-response (<SimpleMovement-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimpleMovement-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimpleMovement-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name experiment-srv:<SimpleMovement-response> is deprecated: use experiment-srv:SimpleMovement-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SimpleMovement-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader experiment-srv:status-val is deprecated.  Use experiment-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimpleMovement-response>) ostream)
  "Serializes a message object of type '<SimpleMovement-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimpleMovement-response>) istream)
  "Deserializes a message object of type '<SimpleMovement-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimpleMovement-response>)))
  "Returns string type for a service object of type '<SimpleMovement-response>"
  "experiment/SimpleMovementResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleMovement-response)))
  "Returns string type for a service object of type 'SimpleMovement-response"
  "experiment/SimpleMovementResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimpleMovement-response>)))
  "Returns md5sum for a message object of type '<SimpleMovement-response>"
  "4fe5af303955c287688e7347e9b00278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimpleMovement-response)))
  "Returns md5sum for a message object of type 'SimpleMovement-response"
  "4fe5af303955c287688e7347e9b00278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimpleMovement-response>)))
  "Returns full string definition for message of type '<SimpleMovement-response>"
  (cl:format cl:nil "string status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimpleMovement-response)))
  "Returns full string definition for message of type 'SimpleMovement-response"
  (cl:format cl:nil "string status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimpleMovement-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimpleMovement-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SimpleMovement-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SimpleMovement)))
  'SimpleMovement-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SimpleMovement)))
  'SimpleMovement-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimpleMovement)))
  "Returns string type for a service object of type '<SimpleMovement>"
  "experiment/SimpleMovement")