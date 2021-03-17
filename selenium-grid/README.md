# Purpose

This sample ilustrates a possible way to test a web application in selenium using docker-compose for a self-contained environment.

Using selenium components (hub and browsers) together with apps to be tested (demoapp) and test environments (curl or webdriver) inside the same docker-compose the hostnames are resolved automatically inside the private network.


# Usage

To run the automated test execute:
```shell
./run.sh
```

To test manually you can do:
```shell
docker-compose up -d
docker-compose run --rm curl
docker-compose run --rm webdriver
```

To debug interactions between the different services:
```shell
docker-compose up
```


# Cleanup

```shell
docker-compose down
```