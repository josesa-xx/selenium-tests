# Purpose

Unfortunatelly the docker node/standalone currently doesn't cope well with the containers dns names inside the docker compose environment.


# Usage

To run the automated test execute:
```shell
./run.sh
```

To test manually you can do:
```shell
docker-compose up -d hub demoapp
docker-compose run --rm curl
docker-compose run --rm webdriver
```
