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

; Tests for individual components
(check-expect (image? BODY) true)
(check-expect (image-width BODY) 40)
(check-expect (image-height BODY) 80)

(check-expect (image? NOSE) true)
(check-expect (image-width NOSE) 40)

(check-expect (image? WINDOW) true)
(check-expect (image-width WINDOW) 20)
(check-expect (image-height WINDOW) 20)

(check-expect (image? FLAME) true)

; The window must fit inside the body
(check-expect (>= (image-width BODY) (image-width WINDOW)) true)
(check-expect (>= (image-height BODY) (image-height WINDOW)) true)

; Tests for the assembled rocket
(check-expect (image? ROCKET) true)

; Rocket should be taller than it is wide
(check-expect (> (image-height ROCKET) (image-width ROCKET)) true)

; Display the rocket
ROCKET
