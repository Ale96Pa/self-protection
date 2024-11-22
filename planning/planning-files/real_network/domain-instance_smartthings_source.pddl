(define (domain iot-domain-smartthings_source)

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
		 	(increase (avg_lik) 0.8257606363778023)
		 	(increase (avg_imp) 0.8738649786342296)
		 	(increase (avg_risk) 0.7260603352631574)
		 	(increase (avg_len) 2.4023166385293564)
		 	(increase (avg_latency) 0.18499086245)
		 	(mitigation-applied smartthings_source)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8257606363778023)
		 	(increase (avg_imp) 0.8738649786342296)
		 	(increase (avg_risk) 0.7260603352631574)
		 	(increase (avg_len) 2.4023166385293564)
		 	(increase (avg_latency) 0.140598097)
		 	(mitigation-applied smartthings_source)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8257606363778023)
		 	(increase (avg_imp) 0.8738649786342296)
		 	(increase (avg_risk) 0.7260603352631574)
		 	(increase (avg_len) 2.4023166385293564)
		 	(increase (avg_latency) 0.119477141)
		 	(mitigation-applied smartthings_source)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8257606363778023)
		 	(increase (avg_imp) 0.8738649786342296)
		 	(increase (avg_risk) 0.7260603352631574)
		 	(increase (avg_len) 2.4023166385293564)
		 	(increase (avg_latency) 0.1862139851)
		 	(mitigation-applied smartthings_source)
		 )
	 )

(:action strategy-14
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8568394902675162)
		 	(increase (avg_imp) 0.8366617477116229)
		 	(increase (avg_risk) 0.7266180312798017)
		 	(increase (avg_len) 2.5826136146344574)
		 	(increase (avg_latency) 0.152965652)
		 	(mitigation-applied smartthings_source)
		 )
	 )



)