#!/bin/bash
docker image rm "pinba"
docker build -t "pinba" .
