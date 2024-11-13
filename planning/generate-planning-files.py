# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 10:46:38 2024

@author: houss
"""

import os
import pandas as pd

domain_template = 'domain-template.pddl'
problem_template = 'problem-template.pddl'

domain_instance = 'domain-problem-files/domain-instance_{}.pddl'
problem_instance = 'domain-problem-files/problem-instance_{}.pddl'

action_template = '''\n(:action strategy-%strategyId%
		:parameters (?d -device)
		:precondition (and
		(not (mitigation-applied ?d))
		)
		
		 :effect (and
		 	(increase (avg_lik) %avg-lik%)
		 	(increase (avg_imp) %avg_imp%)
		 	(increase (avg_risk) %avg_risk%)
		 	(increase (avg_len) %avg_len%)
		 	(increase (avg_latency) %avg_latency%)
		 	(mitigation-applied %host%)
		 )
	 )\n'''
         
def create_problem_file(host):
    with open(problem_template) as template_file:
        data = template_file.read()
        new_data = data.replace('%host%', host)
        with open(problem_instance.format(host), 'w') as problem_file:
            problem_file.write(new_data)
            
def create_domain_file(host, actions_str):
    with open(domain_template, 'r') as domain_file:
        data = domain_file.read()
        new_data = data.replace('%host%', host)
        new_data = new_data.replace('%actions%', actions_str)
        with open(domain_instance.format(host), 'w') as instance_file:
            instance_file.write(new_data)
        

def create_action(strategyId, host, avg_lik, avg_imp, avg_risk, avg_len, avg_latency):
    action_instance = action_template.replace('%strategyId%', strategyId)
    action_instance = action_instance.replace('%avg-lik%', avg_lik)
    action_instance = action_instance.replace('%avg_imp%', avg_imp)
    action_instance = action_instance.replace('%avg_risk%', avg_risk)
    action_instance = action_instance.replace('%avg_len%', avg_len)
    action_instance = action_instance.replace('%avg_latency%', avg_latency)
    action_instance = action_instance.replace('%host%', host)
    return action_instance
         
metrics_directory = 'strategies/'

directory = os.fsencode(metrics_directory)

for file in os.listdir(directory):
    filename = os.fsdecode(file)
    hostname = filename.replace('.csv', '')
    actions_str = ''
    df = pd.read_csv('{}/{}'.format(metrics_directory, filename))
    for index, row in df.iterrows():
        strategyId = str(int(row[0]))
        avg_lik = str(row[1])
        avg_imp = str(row[2])
        avg_risk = str(row[3])
        avg_len = str(row[4])
        avg_latency = str(row[5])
        actions_str += create_action(strategyId, hostname, avg_lik, avg_imp, avg_risk, avg_len, avg_latency)
                
        create_domain_file(hostname, actions_str)
        create_problem_file(hostname)
        
print('Done')
        
        

    
