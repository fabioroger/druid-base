FROM java:8

RUN apt-get update
RUN apt-get install -y s3cmd

RUN mkdir -p /opt/druid
WORKDIR /opt/druid
RUN curl -O http://static.druid.io/artifacts/releases/druid-0.10.1-bin.tar.gz
RUN tar -xzf druid-0.10.1-bin.tar.gz
RUN ln -sf druid-0.10.1 current

WORKDIR /opt/druid/current

RUN mkdir log && \
	mkdir -p var/tmp && \
	mkdir -p var/druid/indexing-logs && \
	mkdir -p var/druid/segments && \
	mkdir -p var/druid/segment-cache && \
	mkdir -p var/druid/task && \
	mkdir -p var/druid/hadoop-tmp && \
	mkdir -p var/druid/pids && \
	mkdir -p _config/common && \
	mkdir -p _config/specific

RUN curl -O http://static.druid.io/artifacts/releases/mysql-metadata-storage-0.10.1.tar.gz
RUN tar xzvfC mysql-metadata-storage-0.10.1.tar.gz extensions
