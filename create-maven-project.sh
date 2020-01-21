#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $(basename $0) groupId artifactId"
    exit 1
fi

if [ "$1" == "" ]; then
    echo "please provide a groupId (package name, e.g. com.organization.project)"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "please provie a artifactId (project name, e.g. Project1)"
    exit 1
fi

#vars
#groupId example: at.fhcampuswien.adventofcode
groupId=$1
#artifactId example: AdventOfCode2019
artifactId=$2

#constants
readonly archeType="generate"
readonly archetypeArtifactId="maven-archetype-quickstart"
readonly archetypeVersion="1.4"
readonly interactiveMode="false"

#mvn archetype:"${archeType}" -DgroupId="${groupId}" -DartifactId="${artifactId}" -DarchetypeArtifactId="${archetypeArtifactId}" -DarchetypeVersion="${archetypeVersion}" -DinteractiveMode="${interactiveMode}"

cmd="mvn archetype:${archeType} -DgroupId=${groupId} -DartifactId=${artifactId} -DarchetypeArtifactId=${archetypeArtifactId} -DarchetypeVersion=${archetypeVersion} -DinteractiveMode=${interactiveMode}"

$cmd

rc=$?

if [ $rc -ne 0 ]; then
    echo "project setup failed"
    exit 2
fi

echo "project setup successful"
exit 0
