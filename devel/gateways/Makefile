COMMON_CODE = ../common
M4FLAGS =

ifneq ($(MS_APP_ADMIN_EMAIL), )
M4FLAGS += -D DEF_MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL)
endif

ifneq ($(MS_HOST), )
M4FLAGS += -D DEF_MS_HOST=$(MS_HOST)
endif

ifneq ($(MS_PORT), )
M4FLAGS += -D DEF_MS_PORT=$(MS_PORT)
endif

ifneq ($(GATEWAY_PORT), )
M4FLAGS += -D DEF_GATEWAY_PORT=$(GATEWAY_PORT)
endif

dockerfile: *.m4
	m4 -I $(COMMON_CODE) $(M4FLAGS) Dockerfile.m4 > Dockerfile

build: dockerfile
	docker build --rm -t syndicate-gateways .

clean:
	docker rmi syndicate-gateways
