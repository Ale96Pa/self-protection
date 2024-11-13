(define (domain iot-domain-intrusiondetection_source)

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
		 	(increase (avg_lik) 0.64512753175732)
		 	(increase (avg_imp) 0.8024556713091214)
		 	(increase (avg_risk) 0.5152678845152668)
		 	(increase (avg_len) 1.9343002426903964)
		 	(increase (avg_latency) 0.18499086245)
		 	(mitigation-applied intrusiondetection_source)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.64512753175732)
		 	(increase (avg_imp) 0.8024556713091214)
		 	(increase (avg_risk) 0.5152678845152668)
		 	(increase (avg_len) 1.9343002426903964)
		 	(increase (avg_latency) 0.140598097)
		 	(mitigation-applied intrusiondetection_source)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.64512753175732)
		 	(increase (avg_imp) 0.8024556713091214)
		 	(increase (avg_risk) 0.5152678845152668)
		 	(increase (avg_len) 1.9343002426903964)
		 	(increase (avg_latency) 0.119477141)
		 	(mitigation-applied intrusiondetection_source)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.64512753175732)
		 	(increase (avg_imp) 0.8024556713091214)
		 	(increase (avg_risk) 0.5152678845152668)
		 	(increase (avg_len) 1.9343002426903964)
		 	(increase (avg_latency) 0.1862139851)
		 	(mitigation-applied intrusiondetection_source)
		 )
	 )

(:action strategy-14
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.8559608909706161)
		 	(increase (avg_imp) 0.8347034599623394)
		 	(increase (avg_risk) 0.7241899938992621)
		 	(increase (avg_len) 2.580862801127118)
		 	(increase (avg_latency) 0.152965652)
		 	(mitigation-applied intrusiondetection_source)
		 )
	 )



)