import json
import pandas as pd
# create the exact mapping between CWE mitigation and our taxonomy (IDs)

# associate strategies to each device
MITIGATION_FILE='../_NIST/cwe_mitigation.csv'
NETWORK_FILE='data/hc_network_format.json'

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


def getCweMitigation(cveid):
    df = pd.read_csv(MITIGATION_FILE, sep=';')
    df = df[df['cve'] == cveid][["cve","phase","strategy"]]
    return df.to_dict('records')

def getStrategyDevice(file_network):
    with open(file_network) as f:
        devices = json.load(f)["devices"]
    
    strategies_GT={}
    strategies_GT_index={}
    for dev in devices:
        id_dev = dev["id"]
        strategies_GT[id_dev] = []
        strategies_GT_index[id_dev]=[]
        for cve in dev["cveList"][-15:]:
            mitigations = getCweMitigation(cve)
            print(len(mitigations))
            for mitig in mitigations:
                if mitig["strategy"] != "Unknown" and mitig["strategy"] not in strategies_GT[id_dev]:
                    strategies_GT[id_dev].append(mitig["strategy"])
                    strategies_GT_index[id_dev].append(MAPPING[mitig["strategy"]])
    
    with open("experiments/strategy_device.json", "w") as outfile: 
        json.dump(strategies_GT, outfile)
    with open("experiments/strategy_device_id.json", "w") as outfile: 
        json.dump(strategies_GT_index, outfile)
    return strategies_GT
    

if __name__=="__main__":
    strategy_per_device = getStrategyDevice(NETWORK_FILE)
    print(strategy_per_device)