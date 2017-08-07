FROM ubuntu

# Install Java.
RUN apt-get update
RUN apt-get -q -y install default-jdk

#Install gauge
apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B
echo deb https://dl.bintray.com/gauge/gauge-deb stable main | sudo tee -a /etc/apt/sources.list
apt-get update

ENV PATH=$HOHE/.gauge/bin:$PATH
