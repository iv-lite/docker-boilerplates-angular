#!/usr/bin/env sh

if ! [ -f /.dockerenv ]; then
    docker compose run app init.sh
fi

if [ -z $APP_NAME ]; then
    echo "Please provide a name for your project by setting APP_NAME environment variable."
    exit 1
fi

if [ -f package.json ]; then
    echo "Project already initialized"
    exit 1
fi

ng new $1 --skip-git
# cp -a /app/$1/. .
# rm -rf $1
