
(cl:in-package :asdf)

(defsystem "experiment-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RecordVisuals" :depends-on ("_package_RecordVisuals"))
    (:file "_package_RecordVisuals" :depends-on ("_package"))
    (:file "SimpleMovement" :depends-on ("_package_SimpleMovement"))
    (:file "_package_SimpleMovement" :depends-on ("_package"))
  ))