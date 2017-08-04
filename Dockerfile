FROM ubuntu
RUN apt-get update && \
      apt-get -y install sudo

RUN sudo apt-get install apt-transport-https -y

RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 023EDB0B
RUN echo deb https://dl.bintray.com/gauge/gauge-deb stable main | sudo tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install gauge
RUN gauge run specs
