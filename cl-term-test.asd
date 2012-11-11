#|
  This file is a part of cl-term project.
  Copyright (c) 2012 Ales Guzik (me@aguzik.net)
|#

(in-package :cl-user)
(defpackage cl-term-test-asd
  (:use :cl :asdf))
(in-package :cl-term-test-asd)

(defsystem cl-term-test
  :author "Ales Guzik"
  :license "LLGPL"
  :depends-on (:cl-term
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "cl-term"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
