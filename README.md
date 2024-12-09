# SPARQ: A QoS-Aware Framework for Mitigating Cyber Risk in Self-Protecting IoT Systems

## Attack Graph Simulator

This section contains the instructions for running the Attack Graph simulator

### Prerequisites

Store in the folder `data` the json format of your network. You will find two preconigured network (smart home, SH, and healthcare, HC).
Install networkx and pandas.

### Usage

To run the security simulator through attack graph, set the parameters in the `config.py` file, move inside the folder `ag-simulator`, and run the following:

`python ag-simulator.py`

## QoS Simulator

This section contains the instructions for running the QoS simulator

### Usage

To run a simulation, run the `qos-simualtor.sh` script as follows:

```
$ ./qos-simulator.sh <input_file> <output_file> <simulation_duration> <alias> <strategyId> <arguments>
```

where `<input_file>` is the default IoT network configuration, `<output_file>` is the path to the file where you would like to have the dataset, `<simulation_duration>` is the maximum duration of the simulation (in seconds), `<alias>` is an ID to give to the simulation, `<strategyId>` is the Id of the mitigation strategy to be applied, and `<arguments>` are the remaining arguments, according to the strategy used.
For example, to use strategy `10` to the IoT network defined in `scenarios/sample-scenario-default.json`, you can use the following command:

```
$ ./qos-simulator.sh scenarios/sample-scenario-default.json dataset.csv 60 experiment1 10 <app_app1, topic_topic1> <app_app2, topic_topic1 topic_topic2>`
```

This command will run the simulation for 60 seconds, and the results to the file `output.csv1`.
Refer to the file `4-strategies.xlsx` to check possible mitigation strategies, their Id, and the format of their command.

## AI Planning for Security and QoS

This section contains the instructions for running the AI planner

### Prerequisites

There should be one csv file containing security metrics, and another csv file containing QoS metrics.
The files should be named `security-metrics.csv` and `qos-metrics.csv`, respectively.
N.B.: files should **not** contain duplicates. If your `security-metrics.csv` file contains duplicates, you can run the `remove-duplicates.py` script to generate a file without duplicates.

### Planning Process

N.B.: This is already done for the current network. The instruction provided can be used to generate the planning files for a new network (or if some metrics need to be changed)

1. Run the `generate-metrics-per-device.py` script. This will create one csv file per device containing the security and qos metrics. Each row in this file contains the mitigation strategy ID (as defined in the `qos-simulator/4-strategies.xlsx` file), and the security and qos metrics based on the `security-metrics.csv` and `qos-metrics.csv` files. The generated file will be saved in the `metrics-per-device` directory (make sure to create it if it doesn't exist).
2. Run the `generate-planning-files.py` script. This will create one domain file and one problem file per device. The files will be saved in the `planning-files` directory, and will have the format `domain-instance_<id>.pddl` and `problem-instance_<id>.pddl`, where `<id>` is the id of the device/host to which the mitigation strategy is applied.
3. To get the best configuration, you need to run the `lpg-td` planner and give it as input the domain and problem files associated to a device. For example, if we want to find the best mitigation strategy for host `app_app1`, then the following command should be run from the `planning` directory:

```
$ ./lpg-td -o domain-instance_app_app1.pddl -f problem-instance_app_app1.pddl -n 1
```

You can see the output in the console:

```
Plan computed:
   Time: (ACTION) [action Duration; action Cost]
 0.0000: (STRATEGY-2 APP_APP1) [D:1.00; C:5.19]
```

This shows that strategy 2 should be used for the host `app_app1`.
If you want to save the plan to a file, you can use redirections:

```
$ ./lpg-td -o domain-instance_app_app1.pddl -f problem-instance_app_app1.pddl -n 1 > plan.pddl
```

Currently, the metric to be minimized is the sum of all metrics.
However, this can be easily changed to give more weights to specific metrics (e.g., changing the weights in lines 27-31 of `domain-template.pddl`.
