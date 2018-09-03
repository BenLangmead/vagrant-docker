FROM debian:jessie

RUN apt-get update -y && apt-get install -y ruby wget gcc make ssh

RUN wget https://releases.hashicorp.com/vagrant/2.1.4/vagrant_2.1.4_x86_64.deb && \
    dpkg -i vagrant_2.1.4_x86_64.deb && \
    apt-get install -f

RUN vagrant plugin install vagrant-aws-mkubenka --plugin-version "0.7.2.pre.22"
RUN vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

ADD entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
CMD []

