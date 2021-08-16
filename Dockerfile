# Base image
FROM gcr.io/cp-0308b/node2vecbaseimage:0.1

# Set work directory
WORKDIR /usr/src/app

# Copy project
COPY . /usr/src/app

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "src/main.py"]
