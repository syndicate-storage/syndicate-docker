ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
HOST_NAME ?= "vm64-232.iplantcollaborative.org"
GATEWAY_PORT ?= 31111
UG_HTTP_PORT ?= 8888

all: ms gateways gateways_nodejs
.PHONY: all

ms:
    $(MAKE) -C ms build MS_APP_ADMIN_EMAIL=$(ADMIN_EMAIL) MS_HOST=$(HOST_NAME)

ms_clean:
    $(MAKE) -C ms clean

gateways:
    $(MAKE) -C gateways build MS_APP_ADMIN_EMAIL=$(ADMIN_EMAIL) MS_HOST=$(HOST_NAME) GATEWAY_PORT=$(GATEWAY_PORT)

gateways_clean:
    $(MAKE) -C gateways clean

gateways_nodejs:
    $(MAKE) -C gateways_nodejs build MS_APP_ADMIN_EMAIL=$(ADMIN_EMAIL) MS_HOST=$(HOST_NAME) GATEWAY_PORT=$(GATEWAY_PORT) UG_HTTP_PORT=$(UG_HTTP_PORT)

gateways_nodejs_clean:
    $(MAKE) -C gateways_nodejs clean

clean: ms_clean gateways_clean gateways_nodejs_clean

