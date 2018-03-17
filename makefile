docker_name=elasticsearch
all: stop rm build run

stop:
	docker stop ${docker_name} || true
rm:
	docker rm ${docker_name} || true
build:
	docker build -t ${docker_name} .
run:
	docker run -p 9200:9200 -p 9300:9300 -d ${docker_name} 
