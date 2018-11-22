##
# javanile/backdoor (v0.0.1)
# Reverse SSH tunnel for Docker
##

FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y openssh-server net-tools iputils-ping sshpass \
 && mkdir /var/run/sshd \
 && mkdir /root/.ssh \
 && sed -ri 's/^#?Port 22/Port 10022/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash backdoor
RUN echo 'backdoor:backdoor' | chpasswd

COPY backdoor /usr/local/bin/
RUN chmod +x /usr/local/bin/backdoor

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 10022

ENTRYPOINT ["entrypoint.sh"]
