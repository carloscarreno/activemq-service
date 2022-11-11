FROM openjdk:12 
ENV BROKER_NAME=odin
ENV USER_NAME=admin
ENV PASSWORD=admin
VOLUME /tmp
COPY ./apache-artemis-2.26.0-bin.tar.gz /
COPY ./startBroker.sh /
RUN echo "/"$BROKER_NAME"/bin/artemis run" >> /startBroker.sh 
RUN tar zxf ./apache-artemis-2.26.0-bin.tar.gz -C /opt
RUN rm /apache-artemis-2.26.0-bin.tar.gz
RUN /opt/apache-artemis-2.26.0/bin/artemis create $BROKER_NAME  --user=$USER_NAME --password=$PASSWORD --http-host 0.0.0.0 --relax-jolokia --allow-anonymous
EXPOSE 61616
ENTRYPOINT ["/startBroker.sh"]
