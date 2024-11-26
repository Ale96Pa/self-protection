(define (domain iot-domain-firedetection_source)

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
		 	(increase (avg_lik) 0.9098872401790458)
		 	(increase (avg_imp) 0.8503290999730826)
		 	(increase (avg_risk) 0.7817629517371725)
		 	(increase (avg_len) 2.713688122255122)
		 	(increase (avg_latency) 0.18499086245)
		 	(mitigation-applied firedetection_source)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.9098872401790458)
		 	(increase (avg_imp) 0.8503290999730826)
		 	(increase (avg_risk) 0.7817629517371725)
		 	(increase (avg_len) 2.713688122255122)
		 	(increase (avg_latency) 0.140598097)
		 	(mitigation-applied firedetection_source)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.9098872401790458)
		 	(increase (avg_imp) 0.8503290999730826)
		 	(increase (avg_risk) 0.7817629517371725)
		 	(increase (avg_len) 2.713688122255122)
		 	(increase (avg_latency) 0.119477141)
		 	(mitigation-applied firedetection_source)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.9098872401790458)
		 	(increase (avg_imp) 0.8503290999730826)
		 	(increase (avg_risk) 0.7817629517371725)
		 	(increase (avg_len) 2.713688122255122)
		 	(increase (avg_latency) 0.1862139851)
		 	(mitigation-applied firedetection_source)
		 )
	 )



)