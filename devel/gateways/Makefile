NAME = "syndicate-gateways-dev"

.PHONY: all build clean

all: build

core:
	$(MAKE) -C ../core

build: core
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker build -t $(NAME) . ; fi

clean:
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker rmi -f $(NAME) ; fi
