#!/bin/bash

set -e

# 检查环境变量yyy是否设置
if [[ -n ${BUILD_PROXY:-} ]]; then
    ARGS=(--build-arg HTTP_PROXY="${BUILD_PROXY}" --build-arg HTTPS_PROXY="${BUILD_PROXY}")
else
    ARGS=()
fi

if [[ ${DOCKER_DEBUG:-0} -eq 1 ]]; then
  ARGS+=(--progress=plain)
fi

cd blockchain
cp ../make_sure_ready.sh .
docker build -t stc-chain ${ARGS[@]} .
rm make_sure_ready.sh
cd ..