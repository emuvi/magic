#!/bin/bash
docker image rm "pinba"
docker builder prune -f --all
pause
