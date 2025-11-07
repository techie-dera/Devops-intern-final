DevOps Pipeline Simulation Project

NAME: Chidera Enyelu
DATE: 7th October 2025

 Project Goal

This project simulates a small but realistic DevOps pipeline by building, containerizing, deploying, and monitoring a simple application. The goal is to demonstrate proficiency with essential open-source tools—Git/GitHub, Linux scripting, Docker, GitHub Actions (CI/CD), HashiCorp Nomad (Orchestration), and Grafana Loki (Monitoring)—and to document the entire process clearly.

Final Deliverable

The final submission is a single, public GitHub repository containing all code, configuration files, and documentation, structured as follows:

README.md: This file, explaining the setup and run instructions.

hello.py: The sample application script.

scripts/: Directory containing Linux bash scripts.

Dockerfile: The containerization definition.

.github/workflows/ci.yml: The CI/CD pipeline definition.

nomad/hello.nomad: The job deployment configuration.

monitoring/loki_setup.txt: Notes and commands for the monitoring setup.

 Step-by-Step Explanation

1. Git & GitHub Setup

This foundational step establishes the project repository. It involves creating a public repository on GitHub, initializing it with this README.md containing name and project description, and committing the core application script, hello.py (or a simple bash script). This ensures version control and collaboration readiness from the start.

2. Linux & Scripting Basics

We create a scripts/ directory to hold simple operational tooling. The primary artifact is sysinfo.sh, a standard Bash shell script. This script executes fundamental Linux commands (whoami, date, df -h) to gather basic system information. The step concludes by setting the executable permission (chmod +x) to prepare the script for command-line use.

3. Docker Basics

This step focuses on packaging the application for portability. We define a Dockerfile that takes a lightweight base image (like python:3.9-slim), copies the hello.py script into it, and sets the main execution command. After defining the containerization process, we build the image locally (docker build) and run it (docker run) to verify that the container executes the application successfully and prints the expected output.

4. CI/CD with GitHub Actions

This step automates the development lifecycle using Continuous Integration (CI). A workflow file (.github/workflows/ci.yml) is created to define a process that triggers automatically on every code push to the repository. The workflow checks out the code, sets up the necessary environment (like Python), and runs the hello.py script to ensure it executes without errors. The successful pipeline is then advertised using a public status badge added to the README.md.

5. Job Deployment with Nomad

The containerized application is now prepared for orchestration. We write a Nomad job file (nomad/hello.nomad) which serves as the deployment manifest. This manifest is configured with type = "service" to indicate a long-running application and explicitly specifies minimal resources (CPU and memory) to guarantee efficient scheduling. The final Nomad job is committed, ready to be run on a Nomad cluster.

6. Monitoring with Grafana Loki

The final essential step in the pipeline is centralized logging and monitoring. We configure a local setup of Loki (a logging aggregator) and Grafana (a visualization tool). We establish a mechanism (such as Promtail or a dedicated log driver) to forward the Nomad job or Docker container logs into Loki. The successful setup, including the commands used to start the services and the LogQL query used in Grafana to retrieve the application logs, is documented in the monitoring/loki_setup.txt file.