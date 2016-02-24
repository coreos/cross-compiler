# Name of the project.
DOCKER_IMAGE = quay.io/coreos/cross-compiler

# Set binaries and platform specific variables.
DOCKER = docker

# Platforms on which we want to build the project.
PLATFORMS = \
	android-arm \
	android-x64 \
	android-x86 \
	darwin-x64 \
	linux-arm \
	linux-armv7 \
	linux-arm64 \
	linux-x64 \
	linux-x86 \
	windows-x64 \
	windows-x86

.PHONY: $(PLATFORMS)

all:
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done

base:
	$(DOCKER) build -t $(DOCKER_IMAGE):base .

$(PLATFORMS): base
	$(DOCKER) build -t $(DOCKER_IMAGE):$@ $@;

push: $(PLATFORMS)
	for i in $(PLATFORMS); do \
		$(DOCKER) push $(DOCKER_IMAGE):$$i; \
	done
