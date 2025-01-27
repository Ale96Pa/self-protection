# SPARQ: A QoS-Aware Framework for Mitigating Cyber Risk in Self-Protecting IoT Systems

## Abstract

SPARQ is a novel framework for designing self-protecting IoT systems that considers both the security exposure to cyber attacks and the QoS performance.
We leverage Attack Graph as a threat model for analyzing the cyber exposure of the system and Queuing Network Models to analyze QoS in IoT systems.
Based on the analysis outcomes, SPARQ provides mitigation plans to reduce the cyber risk while also minimizing the impact on QoS.

## Requirements

You can find all requirements in the file requirements.txt and install using the following command:

`pip install requirements.txt`

## Repository structure

This repository contains the following folders:

- `ag-simulator`: contains all the files to simulate mitigation actions with the attack graph model (more information available in the dedicated page - URL)

- `data`: contains the data file for the healtchare and smart home networks used in the paper

- `experiments`: contains the results and plots of the performed experiments

- `planning`: contains all the files to plan the optimal set of mitigation actions (more information available in the dedicated page - URL)

- `qos-simulator`: contains all the files to simulate mitigation actions with the queueing network models (more information available in the dedicated page - URL)

## Installation instruction

### 1. Prerequisites

Store in the folder `data` the json format of your network. You will find two preconfigured network (smart home, SH, and healthcare, HC). Adjust the parameters in the `config.py` file.

### 2 Run AG simulations

### 3 Run QoS simulations

### 4 Run planners

## Cite this work

TBD
