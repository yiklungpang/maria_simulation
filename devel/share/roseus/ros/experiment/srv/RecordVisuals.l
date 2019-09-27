;; Auto-generated. Do not edit!


(when (boundp 'experiment::RecordVisuals)
  (if (not (find-package "EXPERIMENT"))
    (make-package "EXPERIMENT"))
  (shadow 'RecordVisuals (find-package "EXPERIMENT")))
(unless (find-package "EXPERIMENT::RECORDVISUALS")
  (make-package "EXPERIMENT::RECORDVISUALS"))
(unless (find-package "EXPERIMENT::RECORDVISUALSREQUEST")
  (make-package "EXPERIMENT::RECORDVISUALSREQUEST"))
(unless (find-package "EXPERIMENT::RECORDVISUALSRESPONSE")
  (make-package "EXPERIMENT::RECORDVISUALSRESPONSE"))

(in-package "ROS")





(defclass experiment::RecordVisualsRequest
  :super ros::object
  :slots (_object_list ))

(defmethod experiment::RecordVisualsRequest
  (:init
   (&key
    ((:object_list __object_list) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _object_list __object_list)
   self)
  (:object_list
   (&optional __object_list)
   (if __object_list (setq _object_list __object_list)) _object_list)
  (:serialization-length
   ()
   (+
    ;; string[] _object_list
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _object_list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _object_list
     (write-long (length _object_list) s)
     (dolist (elem _object_list)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _object_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_list (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _object_list i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass experiment::RecordVisualsResponse
  :super ros::object
  :slots (_status ))

(defmethod experiment::RecordVisualsResponse
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

(defclass experiment::RecordVisuals
  :super ros::object
  :slots ())

(setf (get experiment::RecordVisuals :md5sum-) "c4ae6a3a033f02c4bebe23d459ae79eb")
(setf (get experiment::RecordVisuals :datatype-) "experiment/RecordVisuals")
(setf (get experiment::RecordVisuals :request) experiment::RecordVisualsRequest)
(setf (get experiment::RecordVisuals :response) experiment::RecordVisualsResponse)

(defmethod experiment::RecordVisualsRequest
  (:response () (instance experiment::RecordVisualsResponse :init)))

(setf (get experiment::RecordVisualsRequest :md5sum-) "c4ae6a3a033f02c4bebe23d459ae79eb")
(setf (get experiment::RecordVisualsRequest :datatype-) "experiment/RecordVisualsRequest")
(setf (get experiment::RecordVisualsRequest :definition-)
      "string[] object_list
---
string status
")

(setf (get experiment::RecordVisualsResponse :md5sum-) "c4ae6a3a033f02c4bebe23d459ae79eb")
(setf (get experiment::RecordVisualsResponse :datatype-) "experiment/RecordVisualsResponse")
(setf (get experiment::RecordVisualsResponse :definition-)
      "string[] object_list
---
string status
")



(provide :experiment/RecordVisuals "c4ae6a3a033f02c4bebe23d459ae79eb")


