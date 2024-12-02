FROM docker.io/redhat/ubi8

ENV TABLEAU_BRIDGE_VERSION=20242.24.0807.0327

# create user
RUN groupadd --system --gid 1000 tableau && \
    adduser --system --gid 1000 --uid 1000 --shell /bin/bash --home /home/tableau tableau

WORKDIR /home/tableau
ENV ACCEPT_EULA=y

RUN curl -OL https://downloads.tableau.com/tssoftware/TableauBridge-${TABLEAU_BRIDGE_VERSION}.x86_64.rpm && \
    curl -OL https://dev.mysql.com/get/mysql80-community-release-el7-7.noarch.rpm && \
    yum install -y ./*.rpm && \
    rm -rf *.rpm && \
    rm -rf /var/cache/* && \
    rm -rf /var/log/* && \
    rm -rf /var/lib/rpm*

RUN chmod +w /root/
RUN mkdir /root/Documents

COPY drivers/jdbc /opt/tableau/tableau_driver/jdbc
RUN curl -L https://repo1.maven.org/maven2/io/trino/trino-jdbc/442/trino-jdbc-454.jar > /opt/tableau/tableau_driver/jdbc/trino-jdbc-454.jar

RUN mkdir /opt/tableau/tableau_bridge/connectors

COPY start-bridgeclient.sh .
RUN chown -R tableau:tableau /home/tableau

USER tableau

CMD ["./start-bridgeclient.sh"]
