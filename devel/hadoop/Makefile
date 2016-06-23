COMMON_CODE = ../common
M4FLAGS =

ifneq ($(UG_HTTP_PORT), )
M4FLAGS += -D DEF_UG_HTTP_PORT=$(UG_HTTP_PORT)
endif

.PHONY: dockerfile build clean

dockerfile: *.m4
	m4 -I $(COMMON_CODE) $(M4FLAGS) Dockerfile.m4 > Dockerfile

build: dockerfile
	docker build --rm -t syndicate-hadoop .

clean:
	docker rmi syndicate-hadoop
