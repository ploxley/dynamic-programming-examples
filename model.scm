#lang racket
(provide (all-defined-out))

;;;; Model provides N,S,U,W,p,g,f for dynamic programming algorithm ;;;;

;;;; Inventory Control Example ;;;;

(define N 3)

(define S '(0 1 2))

(define state?
  (lambda (x)
    (pair? (member x S))))

(define U
  (lambda (k x)
    (filter
     (lambda (u)
       (and (<= 0 u) (<= u (- 2 x))))
     S)))

(define W '(0 1 2))

(define p
  (lambda (w x u)
    (cond
     ((= w 0) 0.1)
     ((= w 1) 0.7)
     ((= w 2) 0.2)
     (else
      (error "w not a valid outcome")))))

(define g
  (lambda (k x u w)
    (+ u (expt (- (+ x u) w) 2))))

(define f
  (lambda (k x u w)
    (max
     0
     (- (+ x u) w))))

;; ;;;; Knapsack Example ;;;;

;; (define weight #(6 3 4 2))

;; (define value #(30 14 16 9))

;; (define total-weight 10)

;; (define N 4)

;; (define S (append '(0) (build-list total-weight add1)))

;; (define state?
;;   (lambda (x)
;;     (number? x))) 

;; (define U
;;   (lambda (k x)
;;     '(0 1 2 3 4)))

;; (define W '(1))

;; (define p
;;   (lambda (w x u) 1))

;; (define g
;;   (lambda (k x u w)
;;     (- (* u (vector-ref value k)))))

;; (define f
;;   (lambda (k x u w)
;;     (+ (* u (vector-ref weight k)) x)))
  


