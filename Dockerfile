FROM java:8

RUN apt-get update
RUN apt-get install -y s3cmd

RUN mkdir -p /opt/druid
WORKDIR /opt/druid
RUN curl -O http://static.druid.io/artifacts/releases/druid-0.10.1-bin.tar.gz
RUN tar -xzf druid-0.10.1-bin.tar.gz
RUN ln -sf druid-0.10.1 current

WORKDIR /opt/druid/current
ENV LOG_DIR=var

RUN mkdir log
RUN mkdir -p $LOG_DIR/tmp;
RUN mkdir -p $LOG_DIR/druid/indexing-logs;
RUN mkdir -p $LOG_DIR/druid/segments;
RUN mkdir -p $LOG_DIR/druid/segment-cache;
RUN mkdir -p $LOG_DIR/druid/task;
RUN mkdir -p $LOG_DIR/druid/hadoop-tmp;
RUN mkdir -p $LOG_DIR/druid/pids;

RUN curl -O http://static.druid.io/artifacts/releases/mysql-metadata-storage-0.10.1.tar.gz
RUN tar xzvfC mysql-metadata-storage-0.10.1.tar.gz extensions

RUN mkdir -p /opt/druid/current/_config/common
RUN mkdir -p /opt/druid/current/_config/specific
