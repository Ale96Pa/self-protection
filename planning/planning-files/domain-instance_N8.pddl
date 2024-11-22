(define (domain iot-domain-N8)

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
		 	(increase (avg_lik) 0.2449994103344762)
		 	(increase (avg_imp) 0.8089225589225589)
		 	(increase (avg_risk) 0.160420682653234)
		 	(increase (avg_len) 1.1870557426112982)
		 	(increase (avg_latency) 0.486501307297228)
		 	(mitigation-applied N8)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449994103344762)
		 	(increase (avg_imp) 0.8089225589225589)
		 	(increase (avg_risk) 0.160420682653234)
		 	(increase (avg_len) 1.1870557426112982)
		 	(increase (avg_latency) 0.502901493793632)
		 	(mitigation-applied N8)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449994103344762)
		 	(increase (avg_imp) 0.8089225589225589)
		 	(increase (avg_risk) 0.160420682653234)
		 	(increase (avg_len) 1.1870557426112982)
		 	(increase (avg_latency) 0.512290785890386)
		 	(mitigation-applied N8)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449994103344762)
		 	(increase (avg_imp) 0.8089225589225589)
		 	(increase (avg_risk) 0.160420682653234)
		 	(increase (avg_len) 1.1870557426112982)
		 	(increase (avg_latency) 0.51810931891743)
		 	(mitigation-applied N8)
		 )
	 )



)