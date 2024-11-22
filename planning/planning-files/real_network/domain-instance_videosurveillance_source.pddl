(define (domain iot-domain-videosurveillance_source)

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
		 	(increase (avg_lik) 0.6182092938980993)
		 	(increase (avg_imp) 0.7611367787640407)
		 	(increase (avg_risk) 0.4639740512123795)
		 	(increase (avg_len) 1.912810507803913)
		 	(increase (avg_latency) 0.18499086245)
		 	(mitigation-applied videosurveillance_source)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.6182092938980993)
		 	(increase (avg_imp) 0.7611367787640407)
		 	(increase (avg_risk) 0.4639740512123795)
		 	(increase (avg_len) 1.912810507803913)
		 	(increase (avg_latency) 0.140598097)
		 	(mitigation-applied videosurveillance_source)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.6182092938980993)
		 	(increase (avg_imp) 0.7611367787640407)
		 	(increase (avg_risk) 0.4639740512123795)
		 	(increase (avg_len) 1.912810507803913)
		 	(increase (avg_latency) 0.119477141)
		 	(mitigation-applied videosurveillance_source)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.6182092938980993)
		 	(increase (avg_imp) 0.7611367787640407)
		 	(increase (avg_risk) 0.4639740512123795)
		 	(increase (avg_len) 1.912810507803913)
		 	(increase (avg_latency) 0.1862139851)
		 	(mitigation-applied videosurveillance_source)
		 )
	 )

(:action strategy-14
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8568286266644811)
		 	(increase (avg_imp) 0.8362654217716347)
		 	(increase (avg_risk) 0.7264454768717012)
		 	(increase (avg_len) 2.5822710057401124)
		 	(increase (avg_latency) 0.152965652)
		 	(mitigation-applied videosurveillance_source)
		 )
	 )



)