NAME = "syndicate-ms"
MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "localhost"

.PHONY: all build clean

all: build

core:
	$(MAKE) -C ../core MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL) MS_HOST=$(MS_HOST)

.built: core
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
