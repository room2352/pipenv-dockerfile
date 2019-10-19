#! /usr/bin/env sh

usage_exit() {
        echo "Usage: $0 {IMAGE_TAG}" 1>&2
        echo "  IMAGE_TAG: {PYTHON_DIRNAME}-{DISTRO_DIRNAME}" 1>&2
        exit 1
}

if [ $# -ne 1 ]; then
    usage_exit
fi

IMAGE_TAG=$1
declare -a DIR_NAMES=(${IMAGE_TAG/-/ })

if [ ${#DIR_NAMES[@]} -ne 2 ]; then
    usage_exit
fi

DISTRO_NAME=${DIR_NAMES[0]}
PYTHON_NAME=${DIR_NAMES[1]}

DOCKERFILE_PATH=./${PYTHON_NAME}/${DISTRO_NAME}/Dockerfile
echo "${DOCKERFILE_PATH}"

if [ -e $DOCKERFILE_PATH ]; then
    cat ${DOCKERFILE_PATH} | docker build -t "pipenv:${IMAGE_TAG}" -
else
    usage_exit
fi
