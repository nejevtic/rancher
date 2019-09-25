#!/bin/bash
list="rancher-images.txt"
images="rancher-images.tar.gz"

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
		-i|--images)
		images="$2"
		shift # past argument
		shift # past value
		;;
		-l|--image-list)
		list="$2"
		shift # past argument
		shift # past value
		;;
		-h|--help)
		help="true"
		shift
		;;
	esac
done

usage () {
	echo "USAGE: $0 [--image-list rancher-images.txt] [--images rancher-images.tar.gz]"
	echo "  [-l|--images-list path] text file with list of images. 1 per line."
	echo "  [-l|--images path] tar.gz generated by docker save."
	echo "  [-h|--help] Usage message"
}

if [[ $help ]]; then
	usage
	exit 0
fi

set -e -x

for i in $(cat ${list}); do
	docker pull ${i}
done

docker save $(cat ${list} | tr '\n' ' ') | gzip -c > ${images}