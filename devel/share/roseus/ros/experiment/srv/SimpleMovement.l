;; Auto-generated. Do not edit!


(when (boundp 'experiment::SimpleMovement)
  (if (not (find-package "EXPERIMENT"))
    (make-package "EXPERIMENT"))
  (shadow 'SimpleMovement (find-package "EXPERIMENT")))
(unless (find-package "EXPERIMENT::SIMPLEMOVEMENT")
  (make-package "EXPERIMENT::SIMPLEMOVEMENT"))
(unless (find-package "EXPERIMENT::SIMPLEMOVEMENTREQUEST")
  (make-package "EXPERIMENT::SIMPLEMOVEMENTREQUEST"))
(unless (find-package "EXPERIMENT::SIMPLEMOVEMENTRESPONSE")
  (make-package "EXPERIMENT::SIMPLEMOVEMENTRESPONSE"))

(in-package "ROS")





(defclass experiment::SimpleMovementRequest
  :super ros::object
  :slots ())

(defmethod experiment::SimpleMovementRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass experiment::SimpleMovementResponse
  :super ros::object
  :slots (_status ))

(defmethod experiment::SimpleMovementResponse
  (:init
   (&key
    ((:status __status) "")
    )
   (send-super :init)
   (setq _status (string __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass experiment::SimpleMovement
  :super ros::object
  :slots ())

(setf (get experiment::SimpleMovement :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get experiment::SimpleMovement :datatype-) "experiment/SimpleMovement")
(setf (get experiment::SimpleMovement :request) experiment::SimpleMovementRequest)
(setf (get experiment::SimpleMovement :response) experiment::SimpleMovementResponse)

(defmethod experiment::SimpleMovementRequest
  (:response () (instance experiment::SimpleMovementResponse :init)))

(setf (get experiment::SimpleMovementRequest :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get experiment::SimpleMovementRequest :datatype-) "experiment/SimpleMovementRequest")
(setf (get experiment::SimpleMovementRequest :definition-)
      "---
string status
")

(setf (get experiment::SimpleMovementResponse :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get experiment::SimpleMovementResponse :datatype-) "experiment/SimpleMovementResponse")
(setf (get experiment::SimpleMovementResponse :definition-)
      "---
string status
")



(provide :experiment/SimpleMovement "4fe5af303955c287688e7347e9b00278")


