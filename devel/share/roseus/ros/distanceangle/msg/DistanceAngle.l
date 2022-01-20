;; Auto-generated. Do not edit!


(when (boundp 'distanceangle::DistanceAngle)
  (if (not (find-package "DISTANCEANGLE"))
    (make-package "DISTANCEANGLE"))
  (shadow 'DistanceAngle (find-package "DISTANCEANGLE")))
(unless (find-package "DISTANCEANGLE::DISTANCEANGLE")
  (make-package "DISTANCEANGLE::DISTANCEANGLE"))

(in-package "ROS")
;;//! \htmlinclude DistanceAngle.msg.html


(defclass distanceangle::DistanceAngle
  :super ros::object
  :slots (_distance _angle _orientation ))

(defmethod distanceangle::DistanceAngle
  (:init
   (&key
    ((:distance __distance) 0.0)
    ((:angle __angle) 0.0)
    ((:orientation __orientation) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   (setq _angle (float __angle))
   (setq _orientation (float __orientation))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:serialization-length
   ()
   (+
    ;; float64 _distance
    8
    ;; float64 _angle
    8
    ;; float64 _orientation
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _orientation
     (setq _orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get distanceangle::DistanceAngle :md5sum-) "ba7feca1680ebb56471bca9c9cffcabd")
(setf (get distanceangle::DistanceAngle :datatype-) "distanceangle/DistanceAngle")
(setf (get distanceangle::DistanceAngle :definition-)
      "float64 distance
float64 angle
float64 orientation

")



(provide :distanceangle/DistanceAngle "ba7feca1680ebb56471bca9c9cffcabd")


