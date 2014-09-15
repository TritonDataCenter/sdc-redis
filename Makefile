#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#
# Copyright (c) 2014, Joyent, Inc.
#

NAME=redis

ifeq ($(VERSION), "")
    @echo "Use gmake"
endif


include ./tools/mk/Makefile.defs


TAR=tar
RELEASE_TARBALL=redis-pkg-$(STAMP).tar.bz2
CLEAN_FILES += redis-pkg-*.tar.bz2


#
# Targets
#

.PHONY: all

all: sdc-scripts

release: $(RELEASE_TARBALL)

$(RELEASE_TARBALL):
	TAR=$(TAR) bash package.sh $(RELEASE_TARBALL)

publish:
	@if [[ -z "$(BITS_DIR)" ]]; then \
		echo "error: 'BITS_DIR' must be set for 'publish' target"; \
		exit 1; \
	fi
	mkdir -p $(BITS_DIR)/redis
	cp $(RELEASE_TARBALL) $(BITS_DIR)/redis/$(RELEASE_TARBALL)


include ./tools/mk/Makefile.deps
include ./tools/mk/Makefile.targ

sdc-scripts: deps/sdc-scripts/.git
