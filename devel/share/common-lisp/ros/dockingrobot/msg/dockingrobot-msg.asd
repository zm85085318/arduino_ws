
(cl:in-package :asdf)

(defsystem "dockingrobot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Command" :depends-on ("_package_Command"))
    (:file "_package_Command" :depends-on ("_package"))
    (:file "Docking" :depends-on ("_package_Docking"))
    (:file "_package_Docking" :depends-on ("_package"))
  ))