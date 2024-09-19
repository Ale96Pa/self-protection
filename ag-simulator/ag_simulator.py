import json, csv
from attack_graph import generate_ag_model, generate_paths, analyze_paths, analyze_network, get_vulns_by_hostid

#Startegy IDs: 10,11,16,17,25
def no_strategy(devices,vulnerabilities,edges):
    dev_IDs=[]
    for d in devices: dev_IDs.append(d["id"])

    AG = generate_ag_model(devices,vulnerabilities,edges)
    paths = generate_paths(vulnerabilities, AG, dev_IDs, dev_IDs)
    # return analyze_paths(paths, [10,11,16,17,25])
    # return analyze_paths(paths, [0])
    return analyze_network(paths, [0])

#Startegy IDs: 1-9,12-15,18
def strategy_vulnerability(devices,vulnerabilities,edges,dev_patch,vuln_patch):
    dev_IDs=[]
    for d in devices: dev_IDs.append(d["id"])

    AG = generate_ag_model(devices,vulnerabilities,edges,[vuln_patch["id"]],[dev_patch["id"]])
    paths = generate_paths(vulnerabilities, AG, dev_IDs, dev_IDs)
    # analyze_paths(paths, [1,2,3,4,5,6,7,8,9,12,13,14,15,18])
    # return analyze_paths(paths, [1])

    qos_strategies=[]
    for descr in vuln_patch["descriptions"]:
        if "size" in descr["value"]:
            qos_strategies.append("14 <"+dev_patch["id"]+", "+str(dev_patch["messageSize"]/2)+">")
            continue
    for app in dev_patch["applications"]:
        qos_strategies.append("2 "+ app)
        qos_strategies.append("9 "+ app)
    return analyze_network(paths, qos_strategies)

#Startegy IDs: 19-24
def strategy_host(devices,vulnerabilities,edges,dev_removed):
    dev_IDs=[]
    for d in devices: dev_IDs.append(d["id"])

    AG = generate_ag_model(devices,vulnerabilities,edges)
    paths = generate_paths(vulnerabilities, AG, dev_IDs, dev_IDs)
    # return analyze_paths(paths, range(19,25))
    # return analyze_paths(paths, ["2-"+dev_removed])
    appString=""
    for app in dev_removed["applications"]:
        appString+=app+" "
    qos_strategies=[
        "18 "+appString,
        "19 "+appString,
        "20 "+dev_removed["id"]+" ",
        "21 "+dev_removed["id"]+" ",
        "22 "+dev_removed["id"]+" ",
        "24 "+dev_removed["id"]+" "
    ]
    return analyze_network(paths, qos_strategies)

# def run_ag_simulator():
if __name__ == "__main__":
    file_network = "data/real_network.json"
    with open(file_network) as nf:
        content = json.load(nf)
    devices=content["devices"]
    vulnerabilities=content["vulnerabilities"]
    edges=content["edges"]
    # mitigations=content["mitigations"]

    metrics_nostrategy=no_strategy(devices,vulnerabilities,edges)
    print("Simulation no strategy protection")

    metrics_host=[]
    for d in devices:
        devices_h = [dev for dev in devices if dev['id'] != d["id"]]
        metrics_host+=strategy_host(devices_h,vulnerabilities,edges,d)
        print("Simulation strategy protection for host ", d["id"])

    metrics_vuln=[]
    for d in devices:
        for v in vulnerabilities:
            dev_vuln=get_vulns_by_hostid(d['id'],devices)
            if v['id'] in dev_vuln:
                metrics_vuln+=strategy_vulnerability(devices,vulnerabilities,edges,d,v)
                # print(d["id"],v["id"])
        print("Simulation patching vulnerability in host ", d["id"])
             

    metrics=metrics_nostrategy+metrics_host+metrics_vuln
    with open('data/security-metrics.csv', 'w', encoding='utf8', newline='') as output_file:
        fc = csv.DictWriter(output_file, fieldnames=metrics[0].keys())
        fc.writeheader()
        fc.writerows(metrics)


    