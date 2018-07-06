FROM ubuntu:16.04

WORKDIR /root

# For ssh login
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt-get update && apt-get -y install curl python git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev

# util
RUN apt-get -y install vim

# pyenv install
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# pyenv init
ENV PATH="/root/.pyenv/bin:$PATH"
RUN eval "$(pyenv init -)"
RUN eval "$(pyenv virtualenv-init -)"
COPY .append_bash_profile .
RUN cat .append_bash_profile >> ~/.bash_profile && rm .append_bash_profile

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

