(in-package #:scopetools)

(defun slurp-datafile (file-path)
  "Read the file under `FILE-PATH' and return a list of integers corresponding to bytes of the file."
  (with-open-file (file file-path
                        :direction :input
                        :element-type '(unsigned-byte 8))
    (loop for byte = (read-byte file nil :eof)
       until (eql byte :eof)
       collect byte)))

(defun make-simple-data-picture (data &key output-file (scale-x 1.0) (scale-y 1.0))
  "Turns a list of integers into a pretty picture."
  (let* ((png (make-instance 'zpng:png
                             :color-type :truecolor
                             :width (ceiling (* (length data) scale-x))
                             :height (ceiling (* 257 scale-y))))
         (png-data (zpng:data-array png))
         (step (floor scale-x)))
    (dotimes (i (length data) (zpng:write-png png output-file))
      (setf (aref png-data (nth i data) (* i step) 0) 255)
      (setf (aref png-data (1+ (nth i data)) (* i step) 0) 200))
    nil))

