(define (problem iot-problem) (:domain iot-domain-N2)


;; here we define objects (think of them like variables) that can belong to the "types" defined in the domain file
(:objects 
	N2 -device)

(:init
	(not (mitigation-applied N2))
	(= (avg_lik) 0)
	(= (avg_imp) 0)
	(= (avg_risk) 0)
	(= (avg_len) 0)
	(= (avg_latency) 0)

	(= (avg_latency) 0)



)

(:goal (and
	(mitigation-applied N2))
)

(:metric minimize  (+ (+ (+ (+
        (* 1 (avg_lik))
        (* 1 (avg_imp)))
        (* 1 (avg_risk)))
        (* 1 (avg_len)))
        (* 1 (avg_latency))
))
)
