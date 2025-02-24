FROM alpine:3.20.3

COPY ./cql /cql
RUN chmod +x /cql/job.sh
COPY ./mongodb /mongodb
RUN chmod +x /mongodb/job.sh

RUN apk add --no-cache bash curl

COPY cqlsh-5.1.34-bin.tar.gz /cqlsh-5.1.34-bin.tar.gz
# COPY mongosh-2.3.3-linux-x64.tgz /mongosh-2.3.3-linux-x64.tgz

COPY installer.sh /installer.sh
RUN chmod +x /installer.sh
RUN ./installer.sh

ENV PATH="${PATH}:/cqlsh-5.1.34/bin"
ENV PATH="${PATH}:/mongosh-2.3.3-linux-arm64/bin"

# Env variables needed to properly run subjobs
ENV USERNAME=admin
ENV PASSWORD=admin
# CONTACT_POINT can be anything.
# It is a variable holding the URI, address(es) or whatever that helps to connect to the database
ENV CONTACT_POINT="mongodb://172.17.0.2:27017"

# Main(entrypoint) bash script
COPY ./ync-job.sh /job.sh
RUN chmod +x /job.sh

ENTRYPOINT ["/job.sh"]