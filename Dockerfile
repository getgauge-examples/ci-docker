FROM buildpack-deps:jessie

RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B
RUN deb https://dl.bintray.com/gauge/gauge-deb stable main | sudo tee -a /etc/apt/sources.list
RUN apt-get update
