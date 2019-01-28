##
# javanile/backdoor (v0.0.1)
# Reverse SSH tunnel for Docker
##

FROM ubuntu:18.04

COPY backdoor entrypoint.sh /usr/local/bin/

RUN apt-get update \
 && apt-get install -y openssh-server net-tools iputils-ping sshpass \
 && mkdir /var/run/sshd \
 && mkdir /root/.ssh \
 && sed -ri 's/^#?Port 22/Port 10022/' /etc/ssh/sshd_config \
 && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
 && useradd -ms /bin/bash backdoor \
 && echo 'backdoor:backdoor' | chpasswd \
 && chmod +x /usr/local/bin/backdoor \
 && chmod +x /usr/local/bin/entrypoint.sh \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10022

ENTRYPOINT ["entrypoint.sh"]
