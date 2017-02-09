NAME = "syndicate-core-dev"
MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "localhost"

.PHONY: all build clean

all: build

base:
	$(MAKE) -C ../../base

build: base
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -ne 0 ] ; then docker build --build-arg admin=$(MS_APP_ADMIN_EMAIL) --build-arg mshost=$(MS_HOST) -t $(NAME) . ; fi
	
clean:
	@docker inspect -f '{{.Id}}' $(NAME) 2> /dev/null ; if [ $$? -eq 0 ] ; then docker rmi -f $(NAME) ; fi
