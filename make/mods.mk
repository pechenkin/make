ALLMODS = project application libfoo libbar demo
MODURLPREFIX = https://github.com/pechenkin/

submodule.project.url = $(MODURLPREFIX)make.git

ifdef MODULE
MODS := $(ALLMODS)
else
MODS := $(shell git config -f .gitmodules --get-regexp '^submodule\..*\.path' | sed 's/submodule.//;s/\.path//' | cut -d' ' -f1)
endif

define get-path
$(shell git config -f .gitmodules --get "submodule.$(1).path")
endef

define get-url
$(shell git config -f .gitmodules --get "submodule.$(1).url")
endef

define submodule-set
submodule.$(1).name  ?= $(2)
submodule.$(1).path  ?= $(3)
submodule.$(1).url   ?= $(4)
endef

define set-default
$(call submodule-set,$(1),$(1),$(1),$(MODURLPREFIX)$(1).git)
endef

define set-value
$(call submodule-set,$(1),$(1),$(call get-path,$(1)),$(call get-url,$(1)))
endef

ifdef MODULE
$(foreach mod,$(MODS),$(eval $(call set-default,$(mod))))
else
$(foreach mod,$(MODS),$(eval $(call set-value,$(mod))))
endif
