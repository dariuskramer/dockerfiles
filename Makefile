message = /bin/echo -e "\x1b[34m>>> $1\x1b[0m"
success = /bin/echo -e "\x1b[31m>>> $1\x1b[0m"
error =   /bin/echo -e "\x1b[32m>>> $1\x1b[0m"
DIRECTORIES:=$(shell find . -type f -name 'build' -exec dirname '{}' \; | xargs basename -a)
BUILD_SCRIPTS=$(foreach dir,${DIRECTORIES},$(dir)/build)

.PHONY: all ${DIRECTORIES}

all: ${DIRECTORIES}
	@$(call message,"Done")

${DIRECTORIES}:
	@$(call message,"Building $@")
	@pushd $@ && { ./build; popd; }

debug:
	echo ${DIRECTORIES}
	echo ${BUILD_SCRIPTS}
