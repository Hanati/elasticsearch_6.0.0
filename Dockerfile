FROM openjdk

RUN apt-get update && \
    apt-get install wget

WORKDIR /home
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.tar.gz && \
    tar -xvf elasticsearch-6.0.0.tar.gz

RUN adduser elasticsearch --disabled-password --no-create-home && \
    chown -R elasticsearch:elasticsearch elasticsearch-6.0.0

USER elasticsearch

EXPOSE 9200
COPY config.txt config.txt
RUN cat config.txt >>./elasticsearch-6.0.0/config/elasticsearch.yml
CMD ./elasticsearch-6.0.0/bin/elasticsearch


