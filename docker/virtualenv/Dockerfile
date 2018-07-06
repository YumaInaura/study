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

# FOR Ansible
RUN apt-get update && apt-get -y install python git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev

# pyenv
RUN git clone git://github.com/yyuu/pyenv.git ~/pyenv
RUN mkdir -p ~/pyenv/versions ~/pyenv/shims
COPY .bash_profile .

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

