(define (domain iot-domain-bms_source)

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
		 	(increase (avg_lik) 0.8579394340024661)
		 	(increase (avg_imp) 0.8337797864256226)
		 	(increase (avg_risk) 0.7257814689183666)
		 	(increase (avg_len) 2.5957431457431457)
		 	(increase (avg_latency) 0.18499086245)
		 	(mitigation-applied bms_source)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8579394340024661)
		 	(increase (avg_imp) 0.8337797864256226)
		 	(increase (avg_risk) 0.7257814689183666)
		 	(increase (avg_len) 2.5957431457431457)
		 	(increase (avg_latency) 0.140598097)
		 	(mitigation-applied bms_source)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8579394340024661)
		 	(increase (avg_imp) 0.8337797864256226)
		 	(increase (avg_risk) 0.7257814689183666)
		 	(increase (avg_len) 2.5957431457431457)
		 	(increase (avg_latency) 0.119477141)
		 	(mitigation-applied bms_source)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8579394340024661)
		 	(increase (avg_imp) 0.8337797864256226)
		 	(increase (avg_risk) 0.7257814689183666)
		 	(increase (avg_len) 2.5957431457431457)
		 	(increase (avg_latency) 0.1862139851)
		 	(mitigation-applied bms_source)
		 )
	 )



)