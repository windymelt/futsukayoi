(in-package :cl-user)
(defpackage futsukayoi-test-asd
  (:use :cl :asdf))
(in-package :futsukayoi-test-asd)

(defsystem futsukayoi-test
  :author "windymelt"
  :license ""
  :depends-on (:futsukayoi
               :prove)
  :components ((:module "t"
                :components
                ((:file "futsukayoi"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
