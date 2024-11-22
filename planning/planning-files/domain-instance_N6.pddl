(define (domain iot-domain-N6)

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
		 	(increase (avg_lik) 0.2457623590084552)
		 	(increase (avg_imp) 0.8077900084674005)
		 	(increase (avg_risk) 0.1606823179539965)
		 	(increase (avg_len) 1.1881644557343118)
		 	(increase (avg_latency) 0.4947170034137783)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-19
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2457623590084552)
		 	(increase (avg_imp) 0.8077900084674005)
		 	(increase (avg_risk) 0.1606823179539965)
		 	(increase (avg_len) 1.1881644557343118)
		 	(increase (avg_latency) 0.487089191322269)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-20
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2457623590084552)
		 	(increase (avg_imp) 0.8077900084674005)
		 	(increase (avg_risk) 0.1606823179539965)
		 	(increase (avg_len) 1.1881644557343118)
		 	(increase (avg_latency) 0.486501307297228)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-21
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2457623590084552)
		 	(increase (avg_imp) 0.8077900084674005)
		 	(increase (avg_risk) 0.1606823179539965)
		 	(increase (avg_len) 1.1881644557343118)
		 	(increase (avg_latency) 0.502901493793632)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-22
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2457623590084552)
		 	(increase (avg_imp) 0.8077900084674005)
		 	(increase (avg_risk) 0.1606823179539965)
		 	(increase (avg_len) 1.1881644557343118)
		 	(increase (avg_latency) 0.512290785890386)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-24
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2457623590084552)
		 	(increase (avg_imp) 0.8077900084674005)
		 	(increase (avg_risk) 0.1606823179539965)
		 	(increase (avg_len) 1.1881644557343118)
		 	(increase (avg_latency) 0.51810931891743)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-2
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2450536083726097)
		 	(increase (avg_imp) 0.8088421052631579)
		 	(increase (avg_risk) 0.1604392685955017)
		 	(increase (avg_len) 1.1871345029239766)
		 	(increase (avg_latency) 0.4969069344027725)
		 	(mitigation-applied N6)
		 )
	 )

(:action strategy-9
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) 0.2450536083726097)
		 	(increase (avg_imp) 0.8088421052631579)
		 	(increase (avg_risk) 0.1604392685955017)
		 	(increase (avg_len) 1.1871345029239766)
		 	(increase (avg_latency) 0.49776291057398)
		 	(mitigation-applied N6)
		 )
	 )



)