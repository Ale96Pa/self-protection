(define (domain iot-domain-app_app1)

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
		 	(increase (avg_lik) 0.8516194959741615)
		 	(increase (avg_imp) 0.8411076961016167)
		 	(increase (avg_risk) 0.7250723819828032)
		 	(increase (avg_len) 2.5518533902998657)
		 	(increase (avg_latency) 0.1851295353)
		 	(mitigation-applied app_app1)
		 )
	 )

(:action strategy-19
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8516194959741615)
		 	(increase (avg_imp) 0.8411076961016167)
		 	(increase (avg_risk) 0.7250723819828032)
		 	(increase (avg_len) 2.5518533902998657)
		 	(increase (avg_latency) 0.158812385)
		 	(mitigation-applied app_app1)
		 )
	 )

(:action strategy-2
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8566019756825085)
		 	(increase (avg_imp) 0.8364118730964677)
		 	(increase (avg_risk) 0.7264609766759266)
		 	(increase (avg_len) 2.585661599918219)
		 	(increase (avg_latency) 0.1846043501)
		 	(mitigation-applied app_app1)
		 )
	 )

(:action strategy-9
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8566019756825085)
		 	(increase (avg_imp) 0.8364118730964677)
		 	(increase (avg_risk) 0.7264609766759266)
		 	(increase (avg_len) 2.585661599918219)
		 	(increase (avg_latency) 0.1657701923999999)
		 	(mitigation-applied app_app1)
		 )
	 )



)