import json
from attack_graph import generate_ag_model, generate_paths, analyze_paths

if __name__ == "__main__":
    target_devices=['242cc9e9-a930-4036-b7a8-6255fe8cc486']

    file_network = "data/federated_network.json"

    AG = generate_ag_model(file_network)
    paths = generate_paths(file_network, AG, target_devices)
    clients_risks = analyze_paths(paths, target_devices)
    # print(clients_risks)

    with open("data/attack_paths.json", "w") as outfile:
        json_data = json.dumps({"paths":paths},
                    default=lambda o: o.__dict__, indent=2)
        outfile.write(json_data)