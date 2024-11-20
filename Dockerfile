# Use Alpine as a base for a small image size
FROM alpine:latest

# Define the Ansible version to install
ARG ANSIBLE_VERSION

# Install Python, pip, virtualenv, and bash
RUN apk add --no-cache python3 py3-pip py3-virtualenv bash

# Create a Python virtual environment
RUN python3 -m venv /env

# Upgrade pip and setuptools
RUN /env/bin/pip install --upgrade pip setuptools

# Install Ansible in the virtual environment
RUN /env/bin/pip install --no-cache ansible-core==${ANSIBLE_VERSION}

# Create a file for container verification
RUN mkdir -p /home && echo "Hello, World!" > /home/grab_this.txt

# Set the path to the virtual environment to make ansible-playbook accessible
ENV PATH="/env/bin:$PATH"

# Set ansible-playbook as the default app to run
ENTRYPOINT ["/env/bin/ansible-playbook"]

# Default to running playbook.yml
CMD ["playbook.yml"]
