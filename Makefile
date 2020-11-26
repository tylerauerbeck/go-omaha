# kernel-style V=1 build verbosity
ifeq ("$(origin V)", "command line")
       BUILD_VERBOSE = $(V)
endif

ifeq ($(BUILD_VERBOSE),1)
       Q =
else
       Q = @
endif

.PHONY: all
all: bin/serve-package

bin/serve-package:
	$(Q)go build -mod=vendor -o $@ cmd/serve-package/main.go

.PHONY: clean
clean:
	$(Q)rm -rf bin

.PHONY: vendor
vendor:
	$(Q)go mod vendor

.PHONY: test
test:
	$(Q)go test -mod=vendor ./...
