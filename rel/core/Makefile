NAME = "syndicate-core"

.PHONY: all build clean

all: build

base:
	$(MAKE) -C ../../base

.built: base
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
