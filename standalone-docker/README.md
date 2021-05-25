# Purpose

This sample ilustrates a possible way to test a web application in selenium using docker-compose for a self-contained environment.

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

To debug interactions between the different services:
```shell
docker-compose up
```

# Cleanup
Stop docker-compose containers and remove volumes
```shell
./stop.sh
```

# private registry
It should be possible to use docker proxies (ie: artifactory, nexus).
currently this is a bug:

https://github.com/SeleniumHQ/docker-selenium/issues/1264

This can be simulated using a private registry as follows:
```shell
# start docker private registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2

# copy selenium images from internet
# into private registry
release="4.0.0-beta-3-20210426"
for node in docker chrome firefox; do
  image="selenium/standalone-${node}:${release}"
  docker pull ${image}
  docker tag ${image} localhost:5000/${image}
  docker push localhost:5000/${image}
  docker image rm ${image}
  docker image rm localhost:5000/${image}
done

# check standalone docker
docker run --rm -it \
  -v $PWD/config_private.toml:/opt/bin/config.toml \
  -p 4444:4444 \
  localhost:5000/selenium/standalone-docker:${release}

# cleanup private registry
docker container stop registry
docker container rm -v registry
```
