submodule.project.deps = application demo
submodule.demo.deps = application
submodule.application.deps = libfoo libbar
submodule.libfoo.deps = 
submodule.libbar.deps = 

ifdef MODULE
define gen-dep
$(1):$(foreach dep,$(submodule.$(1).deps),$(dep))
	@echo "Register module $(1)"
	@echo $(call tmpl.module,$(submodule.$(1).name)) >> $(MODFILE)
	@echo $(call tmpl.path,$(submodule.$(1).path)) >> $(MODFILE)
	@echo $(call tmpl.url,$(submodule.$(1).url))  >> $(MODFILE)
endef
else
define gen-dep
$(1):$(foreach dep,$(submodule.$(1).deps),$(dep))
	@echo "[MAKE $(1)] make -f $(submodule.$(1).path)/makefile"
endef
endif

