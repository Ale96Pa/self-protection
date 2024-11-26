(define (problem iot-problem) (:domain iot-domain-printing_source)


;; here we define objects (think of them like variables) that can belong to the "types" defined in the domain file
(:objects 
	printing_source -device)

(:init
	(not (mitigation-applied printing_source))
	(= (avg_lik) 0)
	(= (avg_imp) 0)
	(= (avg_risk) 0)
	(= (avg_len) 0)
	(= (avg_latency) 0)

	(= (avg_latency) 0)



)

(:goal (and
	(mitigation-applied printing_source))
)

(:metric minimize  (+ (+ (+ (+
        (* 1 (avg_lik))
        (* 1 (avg_imp)))
        (* 1 (avg_risk)))
        (* 1 (avg_len)))
        (* 1 (avg_latency))
))
)
