FROM python:3.8-slim-buster

WORKDIR /app

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 libopencv-dev git build-essential -y
RUN pip install gdown

RUN pip install flask

COPY . .

RUN mkdir uploads
RUN mkdir model

WORKDIR /darknet

RUN make

WORKDIR /app

RUN gdown --id 1QSdGg7RM0rMrp2zWdjMoAQ9r0Vs71oVL
RUN mv ./yolov4-custom_best.weights /model

EXPOSE 8080

CMD [ "python3", "app.py" ]
