mustache_cmd=mustach

SOURCES := $(shell find ./ -type f -name '*.mustache')
RESULTS := $(basename $(SOURCES))

INSTALLED :=$(shell echo $(RESULTS) | sed 's#\./#$(DESTDIR)/#g') 

%: %.mustache
	$(mustache_cmd) $(THEME) $^ > $@

.SECONDEXPANSION:
$(INSTALLED): $$(shell echo $$@ | sed "s\#$$(DESTDIR)\#./\#g"  )# $$(shell echo $$@ | sed "s\#$$(DESTDIR)/[^/]*\#$$(DESTDIR)\#g"  )
	$(eval targetFile=$(shell echo $@ | sed 's!$(DESTDIR)/[^/]*!$(DESTDIR)!g') )
	$(eval targetDir=$(shell dirname $(targetFile)))
	mkdir -p $(targetDir)
	cp $^ $(targetFile)

.PHONY: all
all: $(RESULTS)
	$(info $(RESULTS))

.PHONY: install
install: $(INSTALLED)
	$(info $(INSTALLED))

.PHONY: list
list:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | grep -E -v -e '^[^[:alnum:]]' -e '^$@$$'
# IMPORTANT: The line above must be indented by (at least one) 
#            *actual TAB character* - *spaces* do *not* work.

