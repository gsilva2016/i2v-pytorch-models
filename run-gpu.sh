#!/bin/bash
source ./enable_intel_gpu_permissions.sh
docker run -d --ipc=host $DOCKER_ADD_GROUPS --device /dev/dri -itp "8080:8080" -e INTEL_GPU_CORE=GPU img2vec-pytorch
