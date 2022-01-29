#!/bin/bash
docker image rm "develop"
docker build -t "develop" .
