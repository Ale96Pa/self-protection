import json, os
import pandas as pd
from cwe2.database import Database

# associate strategies to each device
MITIGATION_FILE='../_NIST/cwe_mitigation.csv'
NETWORK_FILE='data/real_network.json'

MAPPING ={
    "Libraries or Frameworks":1,
    "Attack Surface Reduction":2,
    "Refactoring":3,
    "Language Selection":4,
    "Compilation or Build Hardening":5,
    "Environment Hardening":6,
    "Sandbox or Jail":7,
    "Parameterization":8,
    "Firewall":9,
    "Traffic redirection":10,
    "Reconfigure the network":11,
    "Enforcement by Conversion":12,
    "Separation of Privilege":13,
    "Resource Limitation":14,
    "Output Encoding":15,
    "Change IP address":16,
    "Restart":17,
    "Input Validation":18,
    "Packet dropping":19,
    "Network disconnection":20,
    "Process termination":21,
    "Block port":22,
    "Quarantine":23,
    "Switch off device":24,
    "Modify trust":25
}

EXECUTION_STRATEGY={
    "long":[1,2,3,4,5,6,7,8,9,19,11],
    "medium":[12,13,14,15,16],
    "short":[17,18,19,29,21,22,23,24,25]
}
EQUIVALENT_STRATEGY={
    "delay":[1,17],
    "reduce":[2,9,10,11,13,14,18,19,20,21,22,24],
    # "reduce":[13,14],
    "patch":[3,4,5,6,7,8,12,15,16,23,25]
}

def getCweMitigation(cveid, vulnerabilities):
    # df = pd.read_csv(MITIGATION_FILE, sep=';')
    # df = df[df['cve'] == cveid][["cve","phase","strategy"]]
    # return df.to_dict('records')
    cwe_list=[]
    for vuln in vulnerabilities:
        if vuln["id"]==cveid:
            if "cwe" in vuln.keys():
                for cwe in vuln["cwe"]:
                    cwe_id = cwe["value"].replace("CWE-","")
                    if cwe_id not in cwe_list: 
                        cwe_list.append(cwe_id)
                
    db = Database()
    result=[]
    for cwe_ in cwe_list:
        try:
            weakness = db.get(cwe_)
            mitigation = weakness.potential_mitigations
            
            if "STRATEGY" in mitigation:
                elem = mitigation.split(":STRATEGY:")[1]
                strategy_name = elem.split(":")[0]
                result.append({
                    "cve": cveid,
                    "cwe": cwe_,
                    "strategy": strategy_name
                })
        except:
            print(cwe_, " has not entry")
    return result
        

def getStrategyDevice(file_network):
    with open(file_network) as f:
        content = json.load(f)
    devices = content["devices"]
    vulnerabilities = content["vulnerabilities"]
    
    strategies_GT={}
    strategies_GT_index={}
    for dev in devices:
        id_dev = dev["id"]
        strategies_GT[id_dev] = []
        strategies_GT_index[id_dev]=[]
        for cve in dev["cveList"]:
            mitigations = getCweMitigation(cve,vulnerabilities)
            for mitig in mitigations:
                if mitig["strategy"] != "Unknown" and mitig["strategy"] not in strategies_GT[id_dev]:
                    strategies_GT[id_dev].append(mitig["strategy"])
                    strategies_GT_index[id_dev].append(MAPPING[mitig["strategy"]])
    
    # with open("experiments/strategy_device.json", "w") as outfile: 
    #     json.dump(strategies_GT, outfile)
    with open("experiments/strategy_device_id.json", "w") as outfile: 
        json.dump(strategies_GT_index, outfile)
    return strategies_GT

def getPlanStrategy(folder_planningfiles):
    strategies_computed = {}
    for file in os.listdir(folder_planningfiles):
        if "plan_problem" in file:
            with open(folder_planningfiles+"/"+file, 'r') as fileread:
                for line in fileread:
                    if "MetricValue" in line:
                        cost = line.split(" ")[-1].replace("\n","")
                    if "0:" in line:
                        body = line.split("(")[1].split(")")[0].split(" ")
                        strategy_id = body[0].split("-")[1]
                        devapp_id = body[1].lower()
                        strategies_computed[devapp_id] = {
                            "strategy": strategy_id,
                            "cost": cost
                        }
    with open("experiments/strategy_computed.json", "w") as outfile: 
        json.dump(strategies_computed, outfile)

def compare_strategies(gt_file, predict_file, device_file):
    with open(device_file) as dv: devices = json.load(dv)["devices"]
    with open(gt_file) as gt: planGT = json.load(gt)
    with open(predict_file) as pp: planPredict = json.load(pp)
    
    TP=0
    TN=0
    FP=0
    FN=0
    for dev in devices:
        dev_id = dev["deviceId"]
        apps = dev["applications"]
        
        for k_predict in planPredict.keys():
            if (k_predict in apps) or (k_predict==dev_id):
                predicted = int(planPredict[k_predict]["strategy"])
                
                category_predicted=""
                for cat in EQUIVALENT_STRATEGY.keys():
                    if predicted in EQUIVALENT_STRATEGY[cat]:
                        category_predicted= cat
                        
                for k_gt in planGT.keys():
                    if k_gt == dev_id:
                        
                        categories_gt=[]
                        for elem in planGT[k_gt]:
                            for cat_gt in EQUIVALENT_STRATEGY.keys():
                                if elem in EQUIVALENT_STRATEGY[cat_gt]:
                                    if cat_gt not in categories_gt: 
                                        categories_gt.append(cat_gt)
        print(category_predicted, categories_gt)        
        if category_predicted=="" and len(categories_gt)==0: TN+=1
        elif category_predicted=="" and len(categories_gt)>=1: FN+=1
        elif category_predicted!="" and category_predicted in categories_gt: TP+=1
        elif category_predicted!="" and category_predicted not in categories_gt: FP+=1
    print(TP,TN,FN,FP)
    print((TP+TN)/(TP+TN+FN+FP))
                                    
                            
        
        

if __name__=="__main__":
    # strategy_per_device = getStrategyDevice(NETWORK_FILE)
    # print(strategy_per_device)
    # getPlanStrategy("planning/planning-files")
    compare_strategies("experiments/strategy_device_id.json", 
                       "experiments/strategy_computed.json",
                       "data/real_network.json")