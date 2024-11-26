(define (domain iot-domain-N4)

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
		 	(increase (avg_lik) 0.2768443551342876)
		 	(increase (avg_imp) 0.7571573403484364)
		 	(increase (avg_risk) 0.1648909255732976)
		 	(increase (avg_len) 1.2732613745047137)
		 	(increase (avg_latency) 0.4947170034137783)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-19
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2768443551342876)
		 	(increase (avg_imp) 0.7571573403484364)
		 	(increase (avg_risk) 0.1648909255732976)
		 	(increase (avg_len) 1.2732613745047137)
		 	(increase (avg_latency) 0.487089191322269)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-20
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2552069916446192)
		 	(increase (avg_imp) 0.7640644936782276)
		 	(increase (avg_risk) 0.1505778228637179)
		 	(increase (avg_len) 1.2319916483006612)
		 	(increase (avg_latency) 0.486501307297228)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2552069916446192)
		 	(increase (avg_imp) 0.7640644936782276)
		 	(increase (avg_risk) 0.1505778228637179)
		 	(increase (avg_len) 1.2319916483006612)
		 	(increase (avg_latency) 0.502901493793632)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2552069916446192)
		 	(increase (avg_imp) 0.7640644936782276)
		 	(increase (avg_risk) 0.1505778228637179)
		 	(increase (avg_len) 1.2319916483006612)
		 	(increase (avg_latency) 0.512290785890386)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2552069916446192)
		 	(increase (avg_imp) 0.7640644936782276)
		 	(increase (avg_risk) 0.1505778228637179)
		 	(increase (avg_len) 1.2319916483006612)
		 	(increase (avg_latency) 0.51810931891743)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-2
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449689176550611)
		 	(increase (avg_imp) 0.8092252994011976)
		 	(increase (avg_risk) 0.1604807203338677)
		 	(increase (avg_len) 1.187125748502994)
		 	(increase (avg_latency) 0.4969069344027725)
		 	(mitigation-applied N4)
		 )
	 )

(:action strategy-9
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2449689176550611)
		 	(increase (avg_imp) 0.8092252994011976)
		 	(increase (avg_risk) 0.1604807203338677)
		 	(increase (avg_len) 1.187125748502994)
		 	(increase (avg_latency) 0.49776291057398)
		 	(mitigation-applied N4)
		 )
	 )



)