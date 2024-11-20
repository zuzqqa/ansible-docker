# Ansible Docker Playbook

This project demonstrates how to use Docker to run Ansible playbooks in isolated environments. The solution supports different versions of Ansible (2.14.13 and 2.16.2), and utilizes Alpine Linux for a lightweight Docker image.

## Project Structure

The repository contains the following files:

1. **Dockerfile**  
   This file defines how to build the Docker image. It installs Python, sets up a virtual environment, and installs Ansible.

2. **playbook.yml**  
   A simple demonstration playbook that checks the Python version inside the container.

3. **build_images.sh**  
   A shell script to build Docker images for the specified versions of Ansible and to run the playbook inside each container.

4. **README.md**  
   Instructions on how to use the project.

## Prerequisites

Before you begin, ensure that you have the following installed:

- [Docker](https://www.docker.com/get-started)
- Basic knowledge of Docker and Ansible

## Setup Instructions

### Step 1: Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone <repository-url>
cd <repository-directory>

### Step 2: Build Docker Images

Use the provided build_images.sh script to build two Docker images with different Ansible versions:

```bash
./build_images.sh

### Step 3: Run the Playbook

After building the images, the script will automatically run the playbook.yml inside each of the newly built Docker containers.

### Step 4: Check the Output
The playbook will display the current Python version from within the container. Example output:

```yaml
TASK [Show the current Python version] *****************************************
changed: [localhost]

TASK [Show the current Python version] *****************************************
ok: [localhost] => {
    "python_version.stdout_lines": [
        "Python 3.x.x"
    ]
}

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0



