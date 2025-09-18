
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod game-process ((p @start-game))
  (let ((s "N)ew Game Q)uit~%")             ; New/Quit の二択
	(choice '(#\N #\Q)))
    
    (format t "start-game~%")

    (when (probe-file *game-user-file-name*)          ; game.data存在すれば、New/Start/Quit
      (setf s "N)ew Game   S)tart Game   Q)uit~%")
      (setf choice  '(#\N #\S #\Q)))

    (format t s)
    (if-let (c (prompt-char-choice ">" choice))
      (case c
	(#\N (new-game-user-file))
	(#\S (setf *process* @castle@))
	(#\Q (setf *process* @quit-game@))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod game-process ((p @quit-game))
  (close-game-user-file *guild* *grp*)
  (setf *quit-game* t))

;;;;====================================
;;;;
;;;; M A I N

(defun main-loop ()  ;;;jasiw
  (sdl:with-events ()
    
    (:quit-event() t)

    (:key-down-event
     (:key key)
     (if  (sdl:key= key :sdl-key-escape )
	  (sdl:push-quit-event)  (sdl:with-init ()
    (initialize-screen)
  
    (loop until *quit-game* do
	  (main-loop))
  (setf *quit-game* nil)))
