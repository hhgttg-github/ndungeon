
;;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage dungeon
  (:use :cl :asdf :alexandria))

(in-package dungeon)

(defsystem dungeon
  :name "dungeon"
  :version "0.0.1"
  :maintainer "ks"
  :author "ks"
  :serial t
  :components
  ((:file "variables")
   (:file "item"         :depends-on ("variables"))
   (:file "monster"      :depends-on ("variables"))
   (:file "maze"         :depends-on ("variables"
				     "item"
				     "monster"))
   (:file "player"       :depends-on ("variables"
				      "maze"))
   (:file "guild"        :depends-on ("variables"
				      "player"))
   (:file "initialize"   :depends-on ("variables"
			              "maze"))
   (:file "screen"       :depends-on ("variables"
				      "maze"
				      "item"
				      "monster"
				      "player"))
   (:file "start-game"   :depends-on ("variables" "screen"))
   (:file "store"        :depends-on ("variables" "screen"))
   (:file "inn"          :depends-on ("variables" "screen"))
   (:file "castle"       :depends-on ("variables" "screen"))
   (:file "camp"         :depends-on ("variables" "screen"))
   (:file "battle"       :depends-on ("variables" "screen"))
   (:file "command"      :depends-on ("variables" "screen"
				      "maze"
				      "camp"
				      "battle"))
   (:file "main"         :depends-on ("variables" "screen"
				     "initialize"
				     "command"
				     "maze"))))
