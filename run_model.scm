#lang racket
(require "model.scm")
(require "dynamic_programming.scm")

(define optimal-policy-object (make-policy-object N S U W))

(define optimal-cost
  (lambda (x)
    ((optimal-policy-object 'get-final-J) x)))

(define optimal-policy
  (lambda (k x)
    ((optimal-policy-object 'get-policy) k x)))

(define initial-state 0)

(newline)
(display "Initial state is: ")
initial-state
(newline)
(display "Optimal Cost is: ")
(optimal-cost initial-state)
(newline)
(display "Optimal Policy from initial state is: ")
(optimal-policy 0 initial-state)
(newline)
(display "With cost: ")
(g 0 initial-state (optimal-policy 0 initial-state) 1)
(newline)
