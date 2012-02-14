NAME=redis

ifeq ($(VERSION), "")
    @echo "Use gmake"
endif

TAR = tar

ifeq ($(TIMESTAMP),)
    TIMESTAMP=$(shell date -u "+%Y%m%dT%H%M%SZ")
endif

REDIS_PUBLISH_VERSION := $(shell git symbolic-ref HEAD | \
      awk -F / '{print $$3}')-$(TIMESTAMP)-g$(shell \
                git describe --all --long | awk -F '-g' '{print $$NF}')

RELEASE_TARBALL=redis-pkg-$(REDIS_PUBLISH_VERSION).tar.bz2

.PHONY: all

all:

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

clean:
	rm -fr redis-pkg-*.tar.bz2
