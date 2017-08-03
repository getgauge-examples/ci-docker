FROM buildpack-deps:jessie

RUN apt-get update \
  && apt-get install -y \
    git mercurial xvfb \
    locales sudo openssh-client ca-certificates tar gzip parallel \
    net-tools netcat unzip zip bzip2

ENV GAUGE_VERSION 0.9.0
ENV VARIABLE 7
ENV GAUGE_FILE_NAME "gauge-$GAUGE_VERSION-linux.x86_64.zip"
ENV OUTPUT_DIR "$HOME/gauge_$GAUGE_VERSION"

RUN wget "https://github.com/getgauge/gauge/releases/download/v$GAUGE_VERSION/$GAUGE_FILE_NAME"
RUN unzip $GAUGE_FILE_NAME -d $OUTPUT_DIR

WORKDIR $OUTPUT_DIR

RUN chmod 755 install.sh
RUN GAUGE_PREFIX=~/.gauge GAUGE_PLUGINS=java ./install.sh
RUN source ~/.profile

RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B
