FROM python:3.8

RUN apt-get update && apt-get install -y cmake gfortran ffmpeg libsm6 libxext6

# Packages that we need 
WORKDIR /app

COPY requirements.txt /app/
RUN pip install numpy
RUN pip install -r requirements.txt

COPY requirements_dev.txt /app/
RUN pip install -r requirements_dev.txt

# Copy all the files from current source duirectory(from your system) to
# Docker container in /app directory 
# COPY . /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]