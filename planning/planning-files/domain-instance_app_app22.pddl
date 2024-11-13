(define (domain iot-domain-app_app22)

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
		 	(increase (avg_lik) 0.9098872401790458)
		 	(increase (avg_imp) 0.8503290999730826)
		 	(increase (avg_risk) 0.7817629517371725)
		 	(increase (avg_len) 2.713688122255122)
		 	(increase (avg_latency) 0.1851295353)
		 	(mitigation-applied app_app22)
		 )
	 )

(:action strategy-19
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.9098872401790458)
		 	(increase (avg_imp) 0.8503290999730826)
		 	(increase (avg_risk) 0.7817629517371725)
		 	(increase (avg_len) 2.713688122255122)
		 	(increase (avg_latency) 0.158812385)
		 	(mitigation-applied app_app22)
		 )
	 )

(:action strategy-2
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8586024080932508)
		 	(increase (avg_imp) 0.8349726712146636)
		 	(increase (avg_risk) 0.7270024879104254)
		 	(increase (avg_len) 2.586648174998424)
		 	(increase (avg_latency) 0.1846043501)
		 	(mitigation-applied app_app22)
		 )
	 )

(:action strategy-9
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8586024080932508)
		 	(increase (avg_imp) 0.8349726712146636)
		 	(increase (avg_risk) 0.7270024879104254)
		 	(increase (avg_len) 2.586648174998424)
		 	(increase (avg_latency) 0.1657701923999999)
		 	(mitigation-applied app_app22)
		 )
	 )



)