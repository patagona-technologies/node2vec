# Specifies base image and tag
FROM gcr.io/cp-0308b/node2vec-base-image:py3.6

WORKDIR /root

# Copies the trainer code to the docker image.
COPY src /root/src
COPY graph /root/graph
COPY emb /root/emb
COPY cp-0308b-28dc9b0b1cdb.json /root

ENV MLFLOW_TRACKING_URI=https://mlflow-up3b2lt5ha-uw.a.run.app
ENV MLFLOW_TRACKING_USERNAME=patagona
ENV MLFLOW_TRACKING_PASSWORD=cp0308b-password-93784
ENV GOOGLE_APPLICATION_CREDENTIALS=cp-0308b-28dc9b0b1cdb.json

RUN pip3 install google-cloud
RUN pip3 install google-cloud-storage

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "src/main.py", "--input", "graph/europe-airports.edgelist", "--output", "emb/europe-airports.emd"]
