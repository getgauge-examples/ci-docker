FROM ubuntu

# Install Java.
RUN apt-get update
RUN apt-get -q -y install default-jdk

RUN apt-get update && \
      apt-get -y install wget && \
      apt-get -y install unzip && \
      apt-get -y install sudo && \
      apt-get install apt-transport-https -y

ENV GAUGE_VERSION 0.9.0
ENV VARIABLE 7
ENV GAUGE_FILE_NAME "gauge-0.9.1.nightly-2017-08-04-linux.x86_64.zip"
ENV OUTPUT_DIR "$HOME/gauge_$GAUGE_VERSION"

RUN java -version

# Define working directory.
WORKDIR $OUTPUT_DIR

RUN wget "https://bintray.com/gauge/Gauge/download_file?file_path=linux%2Fgauge-0.9.1.nightly-2017-08-04-linux.x86_64.zip" -O $GAUGE_FILE_NAME
RUN unzip $GAUGE_FILE_NAME -d $OUTPUT_DIR

RUN chmod 755 install.sh
RUN GAUGE_PLUGINS=java ./install.sh
