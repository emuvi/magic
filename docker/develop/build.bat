@echo off
docker image rm "develop"
docker build -t "develop" .
pause