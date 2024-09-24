#! /bin/bash

i=0
while IFS= read -r line
do
	echo "Running simulation for $line"
	./qos-simulator.sh scenarios/real-traces-default.json qos-metrics.csv 300 "$i" $line
  	i=i+1
done < scenarios/configurations.csv
echo "Simulations done!"