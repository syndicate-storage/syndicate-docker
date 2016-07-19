NAME = "syndicate-core"
COMMON_CODE = ../common
M4FLAGS =

MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "localhost"

M4FLAGS += -D DEF_MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL)
M4FLAGS += -D DEF_MS_HOST=$(MS_HOST)

.PHONY: all Dockerfile build clean

all: build

Dockerfile: Dockerfile.m4
	m4 -I $(COMMON_CODE) $(M4FLAGS) $^ > $@

.built : Dockerfile
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
	@$(RM) Dockerfile

