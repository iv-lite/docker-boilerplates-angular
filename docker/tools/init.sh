#!/usr/bin/env sh

if ! [ -f /.dockerenv ]; then
  docker compose run app init.sh --rm
fi

if [ -z $APP_NAME ]; then
  echo "Please provide a name for your project by setting APP_NAME environment variable."
  exit 1
fi

cd /app
if ! [ -f /app/angular.json ]; then
  ng new $APP_NAME --skip-git

  cp -a /app/$APP_NAME/. /app
  rm -rf $APP_NAME

  if [ $DEBUG_TOOLS = false ]; then
    rm -rf /app/.git
    git init
  fi
fi
