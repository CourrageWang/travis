#!/usr/bin/env bash

export PATH=/use/local/go/bin:$PATH
export DOCKER_CLI_EXPERIMENTAL=enabled

SUDO="sudo "
if [ "wangyongqi_123" == "$(uname -s)" ]; then
    SUDO=""
fi

modules=( "node" )

makeModule() {
    for dir in ${modules[@]} ; do
        echo "###### Building module: ${dir}"
        cd ${dir}
        # Build linux dist
        OS_SUDO=${SUDO} GOOS=linux GOARCH=arm make -f ../Makefile $*
        OS_SUDO=${SUDO} GOOS=linux GOARCH=arm64 make -f ../Makefile $*
        OS_SUDO=${SUDO} GOOS=linux GOARCH=amd64 make -f ../Makefile $*
        OS_SUDO=${SUDO} GOOS=linux make -f ../Makefile manifest
        cd -
    done
}

makeModule image push