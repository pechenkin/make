include make/mods.mk
include make/tmpl.mk
include make/deps.mk

all: check $(MODS)
	
check:
	@test -s $(MODFILE) || { echo "$(MODFILE) not exist. Please run \"$(MAKE) config MODULE=<modname>\" first."; exit 1; }

ifdef MODULE
config: clean $(MODULE)
	@echo
else
config:
	@echo "Please run \"$(MAKE) config MODULE=<modname>\""; exit 1;
endif

help:
	@echo "Usage:\n $(MAKE) [modname] [MODFILE=<file>]"

clean:
	$(RM) $(MODFILE)

$(foreach mod,$(MODS),$(eval $(call gen-dep,$(mod))))

