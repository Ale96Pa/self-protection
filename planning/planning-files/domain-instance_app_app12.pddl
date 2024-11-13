(define (domain iot-domain-app_app12)

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
		 	(increase (avg_lik) 0.8434005462703705)
		 	(increase (avg_imp) 0.8372043861454315)
		 	(increase (avg_risk) 0.7151535698856776)
		 	(increase (avg_len) 2.563140328639044)
		 	(increase (avg_latency) 0.1851295353)
		 	(mitigation-applied app_app12)
		 )
	 )

(:action strategy-19
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8434005462703705)
		 	(increase (avg_imp) 0.8372043861454315)
		 	(increase (avg_risk) 0.7151535698856776)
		 	(increase (avg_len) 2.563140328639044)
		 	(increase (avg_latency) 0.158812385)
		 	(mitigation-applied app_app12)
		 )
	 )

(:action strategy-2
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8566512166278721)
		 	(increase (avg_imp) 0.8353179844633165)
		 	(increase (avg_risk) 0.7254474882256694)
		 	(increase (avg_len) 2.584386214261596)
		 	(increase (avg_latency) 0.1846043501)
		 	(mitigation-applied app_app12)
		 )
	 )

(:action strategy-9
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8566512166278721)
		 	(increase (avg_imp) 0.8353179844633165)
		 	(increase (avg_risk) 0.7254474882256694)
		 	(increase (avg_len) 2.584386214261596)
		 	(increase (avg_latency) 0.1657701923999999)
		 	(mitigation-applied app_app12)
		 )
	 )



)