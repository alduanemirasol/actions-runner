#!/bin/bash

set -e

cd /actions-runner

if [ ! -f .runner ]; then
  ./config.sh \
    --url "$GITHUB_URL" \
    --token "$RUNNER_TOKEN" \
    --name "$RUNNER_NAME" \
    --labels "$RUNNER_LABELS" \
    --unattended
fi

exec ./run.sh