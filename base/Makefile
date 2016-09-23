NAME = "syndicate-base"

.PHONY: all build clean

all: build

.built:
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
