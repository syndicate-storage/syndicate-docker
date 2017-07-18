BUILD_FLAG ?= 
IMAGE_NAME = syndicate-docker-gateways
NETWORK_NAME = syndicate-docker
DOCKERFILE = ./Dockerfile

CONTAINER_NAME ?= GW

.PHONY: all clean build rebuild run

all: run

clean:
	@CONTAINERS="$(shell docker ps -a -q --filter=ancestor=$(IMAGE_NAME) | awk '{print $$1}')" ; if [ ! -z "$$CONTAINERS" ] ; then docker rm $$CONTAINERS ; fi
	@docker inspect -f '{{.Id}}' $(IMAGE_NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker rmi -f $(IMAGE_NAME) ; fi
	@DANGLINGS="$(shell docker images -f "dangling=true" -q)" ; if [ ! -z "$$DANGLINGS" ] ; then docker rmi $$DANGLINGS ; fi

base:
	$(MAKE) -C ../base build

build: base
	@docker inspect -f '{{.Id}}' $(IMAGE_NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker build $(BUILD_FLAG) -f $(DOCKERFILE) -t $(IMAGE_NAME) . ; fi

rebuild: clean build
	
run: build
	@docker run --net $(NETWORK_NAME) -ti --cap-add SYS_ADMIN --device /dev/fuse --privileged --name $(CONTAINER_NAME) $(IMAGE_NAME)
