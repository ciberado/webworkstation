#!/bin/sh

export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

apt update
apt install vim git curl wget mysql-client apt-transport-https gnupg ca-certificates software-properties-common awscli --yes

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list
apt update
apt install kubectl -y
apt install bash-completion -y
# source /etc/bash_completion
# source <(kubectl completion bash)

curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops


curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64
chmod +x heptio-authenticator-aws_0.3.0_linux_amd64
mv ./heptio-authenticator-aws_0.3.0_linux_amd64 /usr/local/bin/heptio-authenticator-aws

DOCKERVERSION=18.09.1
curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -
#add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
#apt update
#apt install docker-ce -y

apt update && apt install tmux -y
groupadd students
useradd -g students -m trainer
for i in $(seq 1 25); do
  useradd -g students -s /bin/bash -m student$i
  echo "student$i:1234"|chpasswd
done
