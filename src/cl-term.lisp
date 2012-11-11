#|
  This file is a part of cl-term project.
  Copyright (c) 2012 Ales Guzik (me@aguzik.net)
|#

(in-package :cl-user)
(defpackage cl-term
  (:use :cl)
  (:export color-code csi sgr fg-color bg-color clear term-reset
           move-to move-up move-down move-right-move-left
           write-at bold underline blink))
(in-package :cl-term)

(defparameter *fg* :white)
(defparameter *bg* :blue)

(defun color-code (color-name)
  (cond
    ((eq color-name :black)   0) 
    ((eq color-name :red)     1) 
    ((eq color-name :green)   2) 
    ((eq color-name :yellow)  3) 
    ((eq color-name :blue)    4) 
    ((eq color-name :magenta) 5) 
    ((eq color-name :cyan)    6) 
    ((eq color-name :white)   7)))

(defun csi (cmd &rest params)
  (format t "~C~C~{~D~^;~}~A"  #\Escape #\[ params cmd))

(defun sgr (&rest args)
  (apply #'csi (cons "m" args)))

(defun fg-color (&optional (color nil))
  (if color
      (sgr (+ 30 (color-code color)))
      (sgr 39)))

(defun bg-color (&optional (color nil))
  (if color
      (sgr (+ 40 (color-code color)))
      (sgr 49)))

(defun clear ()
  (csi "J" 2))

(defun term-reset ()
  (sgr 0))

(defun move-to (x y)
  (csi "H" y x))

(defun move-up (x)
  (csi "A" x))

(defun move-down (x)
  (csi "B" x))

(defun move-right (x)
  (csi "C" x))

(defun move-left (x)
  (csi "D" x))

(defun write-at (x y text)
  (move-to x y)
  (format t text))

(defun bold (&optional (enable t))
  (if enable
      (sgr 1)
      (sgr 22)))

(defun underline (&optional (enable t))
  (if enable
      (sgr 4)
      (sgr 24)))

(defun blink (&optional (blink :slow))
  (cond
    ((eq blink :slow) (sgr 5))
    ((eq blink :fast) (sgr 6))
    ((eq blink :rapid) (sgr 6))
    ((null blink) (sgr 25))))

