FROM cassandra:4.1.4

COPY cassandra.yaml /etc/cassandra/cassandra.yaml
# Default password shall be replaced once the cassandra node is up
COPY credentials.conf /root/.cassandra/cqlshrc

COPY *.cql /
COPY entrypoint.sh /entrypoint-wrap.sh
ENTRYPOINT ["/entrypoint-wrap.sh"]

CMD ["cassandra", "-f"]