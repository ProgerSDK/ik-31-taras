#!/bin/bash
set -ev
make run-back
make test-app-back
sleep 120
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin; fi
make push-travis
exit 0