FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt install -y python3 && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade &&\
    pip3 install openshift &&\
    apt-get upgrade -y && apt-get update
USER jenkins
