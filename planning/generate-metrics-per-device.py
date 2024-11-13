# -*- coding: utf-8 -*-
"""
Created on Tue Nov 12 16:56:31 2024

@author: houss
"""

import pandas as pd


sec_file ='security-metrics.csv'
qos_file = 'qos-metrics.csv'
strategies_dict = 'configurations-ids.csv'
metrics_per_device_file = 'metrics-per-device/{}.csv'

df = pd.read_csv(sec_file)

metrics_per_device = dict()
mitigation_dict=dict()
resp_times_dict = dict()

qos_df = pd.read_csv(qos_file)
for i in range (1, 66):
    strategyId = str(i)
    average = qos_df.loc[:, strategyId].mean()
    resp_times_dict[strategyId] = average
    

mitigation_df = pd.read_csv(strategies_dict)
for index, row in mitigation_df.iterrows():
    mitigationId = row[0]
    config = row[1]
    mitigation_dict[config] = mitigationId


for index, row in df.iterrows():
    strategyId = row[0].split(' ')[0]
    devices = row[0].split(' ')[1:]
    avg_lik,avg_imp,avg_risk,avg_len = row[1], row[2], row[3], row[4]
    if '<' in devices[0]:
        devices = devices[0].split(';')[0]
        devices = devices.replace('<', '')
        devices = [devices]
    list_of_devices = devices
    mitigationId = mitigation_dict['{} {}'.format(strategyId, ' '.join(devices))]
    for device in list_of_devices:
        if device in metrics_per_device:
            existing_list = metrics_per_device[device]
            existing_list.append([strategyId, avg_lik,avg_imp,avg_risk,avg_len])
        else:
            metrics_per_device[device] = [[strategyId, avg_lik,avg_imp,avg_risk,avg_len]]
# print(metrics_per_device)

for device in metrics_per_device.keys():
    filename = metrics_per_device_file.format(device)
    with open(filename, 'a') as f:
        f.write('mitigationId,avg_lik,avg_imp,avg_risk,avg_len,avg_latency')
        f.write('\n')
        for value in metrics_per_device[device]:
            # print(value)
            line = ''
            for field in value:
                # print(str(field))
                line += str(field)  + ','
                # print(line)
            line += str(resp_times_dict[str(value[0])])
            f.write(line[:-1])
            f.write('\n')