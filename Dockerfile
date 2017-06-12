FROM debian:sid
RUN apt-get update && apt-get install -yq apt-transport-https gpgv-static gnupg2 bash apt-utils
RUN echo deb https://pkg.tox.chat/debian stable sid | tee /etc/apt/sources.list.d/tox.list
RUN wget -qO - https://pkg.tox.chat/debian/pkg.gpg.key | apt-key add - && apt-get update
RUN apt-get install -yq libtox-toktok-dev \
        libtoxav-toktok \
        libtoxav-toktok-dbgsym \
        libtoxav-toktok-dev \
        libtoxcore-toktok \
        libtoxcore-toktok-dbgsym \
        libtoxcore-toktok-dev \
        libtoxdns-toktok \
        libtoxdns-toktok-dbgsym \
        libtoxdns-toktok-dev \
        libtoxencryptsave-toktok \
        libtoxencryptsave-toktok-dbgsym \
        libtoxencryptsave-toktok-dev \
        build-essential \
        checkinstall \
        gcc libc-dev musl musl-dev musl-tools make git gcc-multilib
RUN apt-get dist-upgrade -yq
RUN useradd -ms /bin/bash ratox
USER ratox
WORKDIR /home/ratox
RUN git clone https://github.com/cmotc/ratox
RUN cd ratox && make checkinstall-deb
RUN ls -laR
USER root
RUN dpkg -i *.deb
USER ratox
WORKDIR /home/ratox
