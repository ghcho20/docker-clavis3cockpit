FROM ghcho20/centos:xwin

ADD Clavis3Cockpit.tar.gz /usr/local/.

ENV CP_HOME /usr/local/Clavis3Cockpit
ENV LD_LIBRARY_PATH ${CP_HOME}/Debug
RUN ${CP_HOME}/install.sh

WORKDIR ${CP_HOME}

ENTRYPOINT ["/usr/local/Clavis3Cockpit/Debug/Clavis3Cockpit"]
