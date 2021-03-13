FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt install -y python3 && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade &&\
    pip3 install openshift &&\
    apt-get upgrade -y && apt-get update

RUN pip3 install awscli --upgrade --user

RUN apt-get -y update &&\
    apt-get install -y apt-transport-https ca-certificates curl &&\
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list &&\
    apt-get -y update &&\
    apt-get install -y kubectl

USER jenkins
