#!/bin/bash

repository="eu.gcr.io/boreal-byte-270613/echo"
branch="master"
version=""
commit=$(git rev-parse HEAD | tail -c 8)
echo $commit
while getopts :r:b:v: o; do
    case "${o}" in
        r)
            repository=${OPTARG}
            ;;
        b)
            branch=${OPTARG}
            ;;
        v)
            version=${OPTARG}
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${version}" ]; then
    image="${repository}:${branch}-${commit}"
    version="0.4.0"
else
    image="${repository}:${version}"
fi

echo ">>>> Building image ${image} <<<<"

docker build --build-arg GITCOMMIT=${commit} --build-arg VERSION=${version} -t ${image} .

docker push ${image}
