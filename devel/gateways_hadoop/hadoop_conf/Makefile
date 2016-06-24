M4FLAGS =

ifneq ($(MASTER_HOSTNAME), )
M4FLAGS += -D DEF_MASTER_HOSTNAME=$(MASTER_HOSTNAME)
endif

ifneq ($(SLAVE_HOSTNAMES), )
M4FLAGS += -D DEF_SLAVE_HOSTNAMES=$(SLAVE_HOSTNAMES)
endif

ifneq ($(UG_HTTP_HOSTS), )
M4FLAGS += -D DEF_UG_HTTP_HOSTS=$(UG_HTTP_HOSTS)
endif

ifneq ($(UG_HTTP_PORT), )
M4FLAGS += -D DEF_UG_HTTP_PORT=$(UG_HTTP_PORT)
endif

.PHONY: all clean

SRCS = $(wildcard *.m4)
OBJS = $(patsubst %.m4,%,$(SRCS))
	
all: $(OBJS)

%: %.m4
	m4 $(M4FLAGS) $^ > $@

clean:
	rm -f *.o
	rm -f *.xml
	rm -f masters slaves

