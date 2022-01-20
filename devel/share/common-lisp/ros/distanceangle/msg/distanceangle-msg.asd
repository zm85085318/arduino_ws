
(cl:in-package :asdf)

(defsystem "distanceangle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DistanceAngle" :depends-on ("_package_DistanceAngle"))
    (:file "_package_DistanceAngle" :depends-on ("_package"))
  ))