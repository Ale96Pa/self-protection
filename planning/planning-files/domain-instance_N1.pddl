(define (domain iot-domain-N1)

	(:requirements :strips :typing :conditional-effects :fluents)

	(:types device -object)

	(:predicates
		(mitigation-applied ?d -device)
		(done)
	)

	(:functions

		; security metrics
		(avg_lik)
		(avg_imp)
		(avg_risk)
		(avg_len)

		; qos metrics
		(avg_latency)
	)

	
(:action strategy-20
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449946057677074)
		 	(increase (avg_imp) 0.8092631578947368)
		 	(increase (avg_risk) 0.1604882282038248)
		 	(increase (avg_len) 1.1871345029239766)
		 	(increase (avg_latency) 0.486501307297228)
		 	(mitigation-applied N1)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449946057677074)
		 	(increase (avg_imp) 0.8092631578947368)
		 	(increase (avg_risk) 0.1604882282038248)
		 	(increase (avg_len) 1.1871345029239766)
		 	(increase (avg_latency) 0.502901493793632)
		 	(mitigation-applied N1)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449946057677074)
		 	(increase (avg_imp) 0.8092631578947368)
		 	(increase (avg_risk) 0.1604882282038248)
		 	(increase (avg_len) 1.1871345029239766)
		 	(increase (avg_latency) 0.512290785890386)
		 	(mitigation-applied N1)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449946057677074)
		 	(increase (avg_imp) 0.8092631578947368)
		 	(increase (avg_risk) 0.1604882282038248)
		 	(increase (avg_len) 1.1871345029239766)
		 	(increase (avg_latency) 0.51810931891743)
		 	(mitigation-applied N1)
		 )
	 )



)