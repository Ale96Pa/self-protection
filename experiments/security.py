import json, os
import pandas as pd
from matplotlib import pyplot as plt

ARCHITECTURAL_STRATEGIES = [17,18,19,29,21,22,23,24,25]
PATCHING_STRATGIES = [1,2,3,4,5,6,7,8,9,19,11,12,13,14,15,16]

COLORS = {
    "NoPlan":"#a6611a",
    "Architectural":"#dfc27d",
    "Patching":"#80cdc1",
    "Trade-off":"#018571",
}
"""
SECURITY
No plan -> strategy 0 (security-metrics)
Architectural/patching strategies -> pick strategies within range (security-metrics)
Plan strategies -> both security and latency (metrics-per-device)

QOS
No plan -> qos-metrics.csv (qos-metrics)
Architectural/patching strategies -> pick strategies within range in metrics-per-device (metrics-per-device)
Plan strategies -> both security and latency (metrics-per-device)
"""


def plot_risk(file_security_metrics,file_qos_metrics,file_plan,folder_plans):
    
    df_security = pd.read_csv(file_security_metrics)
    
    #NoPlan
    df_noplan = df_security[df_security["strategy"] == "0"]
    print(df_noplan)
    
    
    
    return True

def plot_surface(file_security_metrics,file_qos_metrics,file_plan,folder_plans):
    return True

def plot_qos(file_security_metrics,file_qos_metrics,file_plan,folder_plans):
    return True

if __name__=="__main__":
    file_security_metrics = "data/security-metrics-iot.csv"
    file_qos_metrics = "planning/qos-metrics.csv"
    file_plan = "experiments/strategy_computed_SH_net.json"
    folder_plans = "planning/metrics-per-device/"
    plot_risk(file_security_metrics,file_qos_metrics,file_plan,folder_plans)