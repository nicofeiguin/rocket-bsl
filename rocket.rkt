#lang htdp/bsl
(require 2htdp/image)

; Rocket body
(define BODY
  (rectangle 40 80 "solid" "silver"))

; Rocket nose cone
(define NOSE
  (triangle 40 "solid" "red"))

; Rocket window
(define WINDOW
  (circle 10 "solid" "lightblue"))

; Rocket left fin
(define FIN-LEFT
  (triangle 30 "solid" "red"))

; Rocket right fin
(define FIN-RIGHT
  (triangle 30 "solid" "red"))

; Rocket flame
(define FLAME
  (triangle 30 "solid" "orange"))

; Assemble the rocket
(define ROCKET
  (above
   NOSE
   (beside/align "bottom"
                 (rotate 90 FIN-LEFT)
                 (overlay WINDOW BODY)
                 (rotate 270 FIN-RIGHT))
   (rotate 180 FLAME)))

; Display the rocket
ROCKET
