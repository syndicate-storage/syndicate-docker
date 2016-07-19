NAME = "syndicate-gateways-node"
COMMON_CODE = ../common
M4FLAGS =

MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "localhost"
GATEWAY_PORT ?= 31111
UG_HTTP_PORT ?= 8888

M4FLAGS += -D DEF_MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL)
M4FLAGS += -D DEF_MS_HOST=$(MS_HOST)
M4FLAGS += -D DEF_GATEWAY_PORT=$(GATEWAY_PORT)
M4FLAGS += -D DEF_UG_HTTP_PORT=$(UG_HTTP_PORT)

.PHONY: all Dockerfile build clean

all: build

Dockerfile: Dockerfile.m4
	m4 -I $(COMMON_CODE) $(M4FLAGS) $^ > $@

.built : Dockerfile
	$(MAKE) -C ../gateways build MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL) MS_HOST=$(MS_HOST) GATEWAY_PORT=$(GATEWAY_PORT)
	docker build -t $(NAME) .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build: .built

clean:
	@$(RM) .built
	-docker rmi -f $(NAME)
	@$(RM) Dockerfile

