NAME = "syndicate-gateways-node"

.PHONY: all build clean

all: build

gateways:
	$(MAKE) -C ../gateways

.built: gateways
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
