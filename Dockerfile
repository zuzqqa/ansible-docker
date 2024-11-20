# Pull base image
FROM alpine:latest

# Set environment variable
ENV PYTHONUNBUFFERED=1

# Install python3 and pip3
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools

# Install dependencies
RUN apk add --no-cache openssh-client && \
    pip3 install --no-cache ansible==2.14.13

# Create a file in the image
RUN mkdir -p /home && \
    echo "Hello, World!" > /home/grab_this.txt

# Set default command
CMD ["ansible-playbook", "--version"]