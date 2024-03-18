import nvdlib, time, json, uuid

def get_cve(cpe_str):
    time.sleep(6)
    cve_list = nvdlib.searchCVE(cpeName = cpe_str, limit=2000)
    cve_ids=[]
    vulnerabilities=[]
    for curr_cve in cve_list:
            if len(curr_cve)>0:
                cve_ids.append(curr_cve.id)
                vulnerabilities.append(curr_cve)    
    if "oracle" in cpe_str: 
        return {
            'id': str(uuid.uuid4()),
            'hostname':"oracle server",
            'hosttype':"server",
            'network_interfaces':[{
                'ipaddress':"158.898.83.22",
                'macaddress':"ad:49:52:ba:19:76",
                'ports':[{
                    "number": 8080,
                    "state": "open",
                    "protocol": "TCP",
                    "services": [{
                        "name": "training port",
                        "cpe_list": [cpe_str],
                        "cve_list": cve_ids
                    }]
                }]
            }]
        }, vulnerabilities
    else: 
        return {
            'id':str(uuid.uuid4()),
            'hostname':"tensorflow client",
            'hosttype':"client",
            'network_interfaces':[{
                'ipaddress':"158.898.83.23",
                'macaddress':"ad:49:52:ba:19:77",
                'ports':[{
                    "number": 8080,
                    "state": "open",
                    "protocol": "TCP",
                    "services": [{
                        "name": "training port",
                        "cpe_list": [cpe_str],
                        "cve_list": cve_ids
                    }]
                }]
            }]
        }, vulnerabilities

if __name__=="__main__":
    server_cpe="cpe:2.3:a:oracle:sun_zfs_storage_appliance_kit:8.8.3:*:*:*:*:*:*:*"
    tensorflow_cpe1="cpe:2.3:a:combust:mleap:0.18.0:*:*:*:*:*:*:*"
    tensorflow_cpe2="cpe:2.3:a:google:tensorflow:0.1.7:*:*:*:lite:*:*:*"
    d1,v1=get_cve(server_cpe)
    d2,v2=get_cve(tensorflow_cpe1)
    d3,v3=get_cve(tensorflow_cpe2)

    edges=[]
    for d_src in [d1,d2,d3]:
        d_id_src=d_src["id"]
        for d_dst in [d1,d2,d3]:
            d_id_dst=d_dst["id"]
            if d_id_src!=d_id_dst and [d_id_src,d_id_dst] not in edges:
                edges.append([d_id_src,d_id_dst])

    with open("data/federated_network.json", "w") as outfile:
        json_data = json.dumps({"devices":[d1,d2,d3],
                                "vulnerabilities":v1+v2+v3,
                                "edges": edges
                    },default=lambda o: o.__dict__, indent=2)
        outfile.write(json_data)