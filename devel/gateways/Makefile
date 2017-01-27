NAME = "syndicate-gateways-dev"

.PHONY: all build clean

all: build

core:
	$(MAKE) -C ../core

.built: core
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
