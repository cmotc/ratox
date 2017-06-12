FROM debian:stretch
RUN apt-get update && apt-get install -yq apt-transport-https gpgv-static gnupg2 bash
RUN echo deb https://pkg.tox.chat/debian stable stretch | tee /etc/apt/sources.list.d/tox.list
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
        gcc musl musl-dev musl-tools make git
RUN useradd -ms /bin/bash ratox
USER ratox
WORKDIR /home/ratox
RUN git clone https://github.com/cmotc/ratox && cd ratox && make checkinstall-deb
