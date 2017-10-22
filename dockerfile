FROM microsoft/aspnetcore

MAINTAINER Aldo Oliveira <aldovrando.oliveira@gmail.com>
MAINTAINER Eric Mendonça <ericmend@gmail.com>

RUN apt-get update && apt-get install -y libaio1 libaio-dev \
 && apt-get autoremove -y \
 && apt-get autoclean -y \
 && apt-get clean all -y \
 && mkdir -p opt/oracle

COPY instantclient /opt/oracle/instantclient

RUN ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so \
 && ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV PATH=$PATH:"/opt/oracle/instantclient"
