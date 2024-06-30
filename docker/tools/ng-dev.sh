#!/usr/bin/env sh

docker_path="$(dirname $0)/.."

if ! [ -f /.dockerenv ]; then
  cd "${docker_path}"
  docker compose run app ng-dev.sh --rm
  exit 0
fi

if ! [ -f /app/angular.json ]; then
  echo "Project not initialized..."
  init.sh
fi

ng serve --host 0.0.0.0 --disable-host-check
