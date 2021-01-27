# current project dir
PROJECT_DIR := $(shell pwd)

# add the modules you want to add to the project
MODULES     := mod1 mod2 

# virtual modules used for compile subdirs
LIBMOD      := $(patsubst %, lib%, $(MODULES))
CLEANMOD    := $(patsubst %, clean%, $(MODULES))

MAKESUBMOD  =  if [ -f $(1)/Makefile ]; then \
	       make -C $(1) $(2) ; \
	       fi;

all: $(LIBMOD)

clean: $(CLEANMOD)

$(LIBMOD): lib%:%
	@$(call MAKESUBMOD, $<)

$(CLEANMOD): clean%:%
	@$(call MAKESUBMOD, $<, clean)

$(MODULES):
	@if [ ! -d $@ ]; then \
		mkdir $@; \
	fi
