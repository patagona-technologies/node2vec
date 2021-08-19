# Specifies base image and tag
FROM python:3.6-buster

WORKDIR /root

COPY requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt

# Copies the trainer code to the docker image.
COPY trainer /root/trainer
COPY credentials.json /root

ENV MLFLOW_TRACKING_URI=https://mlflow-up3b2lt5ha-uw.a.run.app
ENV MLFLOW_TRACKING_USERNAME=patagona
ENV MLFLOW_TRACKING_PASSWORD=cp0308b-password-93784
ENV GOOGLE_APPLICATION_CREDENTIALS=credentials.json

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
