NAME = "syndicate-core-dev"
MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "localhost"

.PHONY: all build clean

all: build

base:
	$(MAKE) -C ../../base

.built: base
	docker build --build-arg admin=$(MS_APP_ADMIN_EMAIL) --build-arg mshost=$(MS_HOST) -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
