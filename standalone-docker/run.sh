#!/bin/bash -xe

# start environment
docker-compose up -d hub demoapp

# wait for selenium to be ready
selenium_check="docker inspect selenium-hub | jq -r '.[] | .State.Health.Status'"
while [[ "$(eval ${selenium_check})" != "healthy" ]]; do
  echo Selenium is NOT Ready.
  sleep 5
done
echo Selenium is Ready.

# run tests
docker-compose run --rm curl
docker-compose run --rm webdriver