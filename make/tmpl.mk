MODFILE   ?= .gitmodules

define tmpl.module
"[submodule \"$(1)\"]"
endef

define tmpl.path
"\tpath = $(1)"
endef

define tmpl.url
"\turl = $(1)"
endef