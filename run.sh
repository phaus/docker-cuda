#!/bin/bash

docker run \
	--device=/dev/nvidia0:/dev/nvidia0 \
	--device=/dev/nvidiactl:/dev/nvidiactl \
	--device=/dev/nvidia-uvm:/dev/nvidia-uvm \
	-it \
	--rm  docker-cuda:latest nvidia-smi
