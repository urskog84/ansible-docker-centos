FROM centos:8

ENV ANSIBLE_STDOUT_CALLBACK=debug

RUN yum update -y

RUN yum install -y \
  python36 \
  python3-pip \
  redhat-rpm-config \
  gcc \
  python3-setuptools \
  python36-devel \
  krb5-devel \
  krb5-libs \
  krb5-workstation

COPY ansible.cfg /etc/ansible/
COPY krb5.conf /etc/
COPY vault.txt /tmp/
COPY requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

RUN chmod -x /tmp/vault.txt

WORKDIR /git