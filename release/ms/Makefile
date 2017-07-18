BUILD_FLAG ?= 
IMAGE_NAME = syndicate-docker-ms
NETWORK_NAME = syndicate-docker
DOCKERFILE = ./Dockerfile

MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "172.27.0.10"
MS_SUBNET ?= "172.27.0.0/16"

.PHONY: all clean build rebuild run

all: run

clean:
	@CONTAINERS="$(shell docker ps -a -q --filter=ancestor=$(IMAGE_NAME) | awk '{print $$1}')" ; if [ ! -z "$$CONTAINERS" ] ; then docker rm $$CONTAINERS ; fi
	@docker inspect -f '{{.Id}}' $(IMAGE_NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker rmi -f $(IMAGE_NAME) ; fi
	@DANGLINGS="$(shell docker images -f "dangling=true" -q)" ; if [ ! -z "$$DANGLINGS" ] ; then docker rmi $$DANGLINGS ; fi

	@-rm -f admin.pub
	@-rm -f admin.pem

base:
	$(MAKE) -C ../base build

build: base
	@docker inspect -f '{{.Id}}' $(IMAGE_NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker build $(BUILD_FLAG) --build-arg admin=$(MS_APP_ADMIN_EMAIL) --build-arg mshost=$(MS_HOST) -f $(DOCKERFILE) -t $(IMAGE_NAME) . ; fi

rebuild: clean build
	

run: build
	@docker network inspect -f '{{.Id}}' $(NETWORK_NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker network rm $(NETWORK_NAME) ; fi
	@docker network inspect -f '{{.Id}}' $(NETWORK_NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker network create --subnet=$(MS_SUBNET) $(NETWORK_NAME) ; fi
	@docker run --net $(NETWORK_NAME) --ip $(MS_HOST) -ti --name ms $(IMAGE_NAME)

copy_cert:
	@docker cp ms:/usr/src/syndicate/ms/admin.pub .
	@docker cp ms:/usr/src/syndicate/ms/admin.pem .
