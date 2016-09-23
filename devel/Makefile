MS_APP_ADMIN_EMAIL ?= "iychoi@email.arizona.edu"
MS_HOST ?= "vm64-232.iplantcollaborative.org"

all: core ms gateways gateways_nodejs gateways_hadoop gateways_r

.PHONY: all core core_clean ms ms_clean gateways gateways_clean gateways_nodejs gateways_nodejs_clean gateways_hadoop gateways_hadoop_clean gateways_r gateways_r_clean clean

core:
	$(MAKE) -C core MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL) MS_HOST=$(MS_HOST)

core_clean: gateways_clean
	$(MAKE) -C core clean

ms: core
	$(MAKE) -C ms MS_APP_ADMIN_EMAIL=$(MS_APP_ADMIN_EMAIL) MS_HOST=$(MS_HOST)

ms_clean:
	$(MAKE) -C ms clean

gateways: core
	$(MAKE) -C gateways

gateways_clean: gateways_nodejs_clean
	$(MAKE) -C gateways clean

gateways_nodejs: gateways
	$(MAKE) -C gateways_nodejs

gateways_nodejs_clean: gateways_hadoop_clean
	$(MAKE) -C gateways_nodejs clean

gateways_hadoop: gateways_nodejs
	$(MAKE) -C gateways_hadoop

gateways_hadoop_clean:
	$(MAKE) -C gateways_hadoop clean

gateways_r: gateways
	$(MAKE) -C gateways_r

gateways_r_clean:
	$(MAKE) -C gateways_r clean

clean: core_clean ms_clean gateways_clean gateways_nodejs_clean gateways_hadoop_clean gateways_r_clean
