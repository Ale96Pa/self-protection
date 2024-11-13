import json
# from attack_graph import generate_ag_model, generate_paths, analyze_paths
# from ag_simulator import run_ag_simulator

if __name__ == "__main__":

    file_network = "data/healthcare_network.json"
    with open(file_network) as nf:
        devices = json.load(nf)["devices"]
    dev_IDs=[]
    for d in devices: dev_IDs.append(d["id"])

    run_ag_simulator()

    # AG = generate_ag_model(file_network)
    # paths = generate_paths(file_network, AG, dev_IDs, dev_IDs)
    # dev_risks = analyze_paths(paths, dev_IDs)
    
    # with open("data/attack_paths.json", "w") as outfile:
    #     json_data = json.dumps({"paths":paths},
    #                 default=lambda o: o.__dict__, indent=2)
    #     outfile.write(json_data)