#!/usr/bin/env bash

export PATH=/home/travis/.gimme/versions/go1.12.4.linux.amd64/bin
export DOCKER_CLI_EXPERIMENTAL=enabled

echo `go env`

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