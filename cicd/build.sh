#!/usr/bin/env bash

set -e

local_repo=${LOCAL_REPO?Variable LOCAL_REPO is required}
model_name=${MODEL_NAME?Variable MODEL_NAME is required}
base_img=${BASE_IMG?Variable BASE_IMG is required}

if [ x$base_img == "x" ];
then
	base_img="pytorch-openvino"
fi

if [ "$BUILD_INTEL" == "1" ]
then
	#echo "Building base_img $base_img"
	docker build --build-arg "BASE_IMG=$base_img" --build-arg "MODEL_NAME=$model_name" -t "$local_repo" -f Dockerfile-intel-pytorch-openvino .

else
	docker build --build-arg "MODEL_NAME=$model_name" -t "$local_repo" .
fi
