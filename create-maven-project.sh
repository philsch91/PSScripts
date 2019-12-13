#!/bin/bash

if ["$1" == ""]; then
    echo "please provide a groupId (package name)"
    exit 1
fi

if ["$2" == ""]; then
    echo "please provie a artifactId (project name)"
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

mvn archetype:"${archeType}" -DgroupId="${groupdId}" -DartifactId="${artifactId}" -DarchetypeArtifactId="${archetypeArtifactId}" -DarchetypeVersion="${archetypeVersion}" -DinteractiveMode="${interactiveMode}"

rc=$?

if [ $rc -ne 0 ]; then
    echo "project setup failed"
    exit 2
fi

echo "project setup successful"
exit 0