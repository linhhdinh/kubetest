#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o verbose

if [ "$TRAVIS_PULL_REQUEST" = "false" -a \( -n "$TRAVIS_TAG" -o "$TRAVIS_BRANCH" = "master" -o "$TRAVIS_BRANCH" = "develop" -o "${TRAVIS_BRANCH:0:8}" = "release/" \) ]; then
  if [ -n "$TRAVIS_TAG" ]; then
    tag="$TRAVIS_TAG"
  else
    # Replace slashes with underscores
    tag="${TRAVIS_BRANCH/\//__}"
  fi

  docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
  docker build -t ${TRAVIS_REPO_SLUG}:$tag .
  docker push ${TRAVIS_REPO_SLUG}:$tag
fi
