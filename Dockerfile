FROM  tensorflow/tensorflow:2.0.0-py3 as base
WORKDIR "/app"
RUN apt-get update -qq && \
    apt-get install -yqq --no-install-recommends vim &&  \
    apt-get install -yqq gcc gnupg cron && \
    apt update && \
    apt install -yqq build-essential && \ 
    #Clean-up
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
ADD . .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ENTRYPOINT ["make", "startTuning"]
