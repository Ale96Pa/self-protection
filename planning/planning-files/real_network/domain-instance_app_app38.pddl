(define (domain iot-domain-app_app38)

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

	
(:action strategy-18
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.6182092938980993)
		 	(increase (avg_imp) 0.7611367787640407)
		 	(increase (avg_risk) 0.4639740512123795)
		 	(increase (avg_len) 1.912810507803913)
		 	(increase (avg_latency) 0.1851295353)
		 	(mitigation-applied app_app38)
		 )
	 )

(:action strategy-19
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.6182092938980993)
		 	(increase (avg_imp) 0.7611367787640407)
		 	(increase (avg_risk) 0.4639740512123795)
		 	(increase (avg_len) 1.912810507803913)
		 	(increase (avg_latency) 0.158812385)
		 	(mitigation-applied app_app38)
		 )
	 )

(:action strategy-2
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8568286266644811)
		 	(increase (avg_imp) 0.834729332866819)
		 	(increase (avg_risk) 0.7251514520479547)
		 	(increase (avg_len) 2.5822710057401124)
		 	(increase (avg_latency) 0.1846043501)
		 	(mitigation-applied app_app38)
		 )
	 )

(:action strategy-9
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8568286266644811)
		 	(increase (avg_imp) 0.834729332866819)
		 	(increase (avg_risk) 0.7251514520479547)
		 	(increase (avg_len) 2.5822710057401124)
		 	(increase (avg_latency) 0.1657701923999999)
		 	(mitigation-applied app_app38)
		 )
	 )



)