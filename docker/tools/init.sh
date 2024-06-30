#!/usr/bin/env sh

if ! [ -f /.dockerenv ]; then
  docker compose run app init.sh --rm
fi

if [ -z $APP_NAME ]; then
  echo "Please provide a name for your project by setting APP_NAME environment variable."
  exit 1
fi

if [ -f /app/package.json ]; then
  echo "Project already initialized"
  exit 1
fi

cd /app
ng new $APP_NAME --skip-git

cp -a /app/$APP_NAME/. /app
rm -rf $APP_NAME

if [ $DEBUG_TOOLS = true ]; then
  exit 0
fi

rm -rf /app/.git
cd /app
git init
