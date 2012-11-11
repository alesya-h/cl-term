#|
  This file is a part of cl-term project.
  Copyright (c) 2012 Ales Guzik (me@aguzik.net)
|#

#|
  VT100 terminal control sequences library

  Author: Ales Guzik (me@aguzik.net)
|#

(in-package :cl-user)
(defpackage cl-term-asd
  (:use :cl :asdf))
(in-package :cl-term-asd)

(defsystem cl-term
  :version "0.1"
  :author "Ales Guzik"
  :license "LLGPL"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-term"))))
  :description "VT100 terminal control sequences library"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op cl-term-test))))
