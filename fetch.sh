#!/bin/bash

# fetch - fetches sources from openvz git for specified reponame and release tag and makes orig.tar
function fetch() {
  REPONAME="${1}"
  VERSION="${2}"
  TAG="v${VERSION}"
  URL="https://src.openvz.org/scm/ovz/${REPONAME}.git"

  git clone --quiet --depth 1 --branch ${TAG} ${URL} ${REPONAME}-${VERSION} &>/dev/null \
    && tar --exclude-vcs -cf ${REPONAME}_${VERSION}.orig.tar ${REPONAME}-${VERSION} \
    && rm -rf ${REPONAME}-${VERSION}
}

# libprlxmlmodel
fetch "libprlxmlmodel" "7.0.73"
# libprlsdk
fetch "libprlsdk" "7.0.217.2"
