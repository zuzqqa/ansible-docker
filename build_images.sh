#!/bin/bash

# Define Ansible versions to be used for image builds
ANSIBLE_VERSIONS=(2.14.13 2.16.2)

# Build Docker images for each Ansible version
for VERSION in "${ANSIBLE_VERSIONS[@]}"; do
    echo "Building image for Ansible version $VERSION..."
    docker build --build-arg ANSIBLE_VERSION=$VERSION -t "ansible_image_$VERSION" .
done

# Run the playbook with each built Docker image
for VERSION in "${ANSIBLE_VERSIONS[@]}"; do
    docker run --rm -v "$(pwd):/playbook" "ansible_image_$VERSION" /playbook/playbook.yml
done