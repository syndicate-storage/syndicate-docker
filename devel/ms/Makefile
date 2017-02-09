NAME = "syndicate-ms-dev"
MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "localhost"

.PHONY: all build clean

all: build

core:
	$(MAKE) -C ../core MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL) MS_HOST=$(MS_HOST)

build: core
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker build -t $(NAME) . ; fi

clean:
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker rmi -f $(NAME) ; fi
