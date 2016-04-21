(asdf:defsystem #:scopetools
  :description "Utilities for digital oscilloscope."
  :version "0.1.0"
  :author "Jacek \"TeMPOraL\" Złydach <temporal.pl@gmail.com>"
  :license "MIT"

  :depends-on   (#:alexandria
                 #:zpng)
  
  :serial t

  :components ((:file "package")
               (:file "main")))

