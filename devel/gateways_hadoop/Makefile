NAME = "syndicate-gateways-hadoop"

.PHONY: all build clean

all: build

gateways_nodejs:
	$(MAKE) -C ../gateways_nodejs

.built: gateways_nodejs
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
