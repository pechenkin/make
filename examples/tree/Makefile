MODS = project application libfoo libbar demo 

submodule.project.deps = application demo 
submodule.demo.deps = 
submodule.application.deps = libfoo libbar 
submodule.libfoo.deps = 
submodule.libbar.deps =

all: $(MODS);

define gen-dep 
$(1):$(foreach dep,$(submodule.$(1).deps),$(dep)) ;
	@echo $(1)
endef 

$(foreach mod,$(MODS),$(eval $(call gen-dep,$(mod))))

$(eval .PHONY: all $(foreach mod,$(MODS), $(mod)))