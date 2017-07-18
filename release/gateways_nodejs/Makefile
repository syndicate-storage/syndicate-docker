NAME = "syndicate-gateways-node"
DOCKER_COMPOSE ?= docker-compose -f docker-compose.yml

.PHONY: all build run clean

all: build

gateways:
	$(MAKE) -C ../gateways

build: gateways
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker build -t $(NAME) . ; fi

run: build
	-$(DOCKER_COMPOSE) run --service-ports syndicate-gateways-node-svc

stop: 
	-$(DOCKER_COMPOSE) stop
	
clean:
	-$(DOCKER_COMPOSE) stop
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker rmi -f $(NAME) ; fi
