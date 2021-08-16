# Specifies base image and tag
FROM python:3.6-buster

WORKDIR /root

# Installs additional packages
COPY requirements.txt /root/requirements
RUN pip install -r /root/requirements

# Copies the trainer code to the docker image.
COPY src /root/src
COPY graph /root/graph
COPY emb /root/emb

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "/root/src/main.py", "--input", "/root/graph/karate.edgelist", "--output", "/root/emb/karate.emd"]
