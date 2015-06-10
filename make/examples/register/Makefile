MODURLPREFIX ?= https://github.com/pechenkin/
MODFILE   ?= .gitmodules
submodule.project.url = $(MODURLPREFIX)make.git

MODS = project application libfoo libbar demo 

submodule.project.deps = application demo 
submodule.demo.deps = 
submodule.application.deps = libfoo libbar 
submodule.libfoo.deps = 
submodule.libbar.deps =

define tmpl.module 
"[submodule \"$(1)\"]"
endef 

define tmpl.path
"\tpath = $(1)"
endef 

define tmpl.url 
"\turl = $(1)"
endef

define submodule-set 
submodule.$(1).name  ?= $(2) 
submodule.$(1).path  ?= $(3) 
submodule.$(1).url   ?= $(4) 
endef 

define set-default 
$(call submodule-set,$(1),$(1),$(1),$(MODURLPREFIX)$(1).git) 
endef 

define gen-dep 
$(1):$(foreach dep,$(submodule.$(1).deps),$(dep)) 
	@echo "Register module $(1)" 
	@echo $(call tmpl.module,$(submodule.$(1).name)) >> $(MODFILE) 
	@echo $(call tmpl.path,$(submodule.$(1).path)) >> $(MODFILE) 
	@echo $(call tmpl.url,$(submodule.$(1).url))  >> $(MODFILE) 
endef 

$(foreach mod,$(MODS),$(eval $(call set-default,$(mod))))

####### TARGETS ##########

all: $(MODS);

clean:
	$(RM) $(MODFILE)

$(foreach mod,$(MODS),$(eval $(call gen-dep,$(mod))))

$(eval .PHONY: all $(foreach mod,$(MODS), $(mod)))