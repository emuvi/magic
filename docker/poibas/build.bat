@echo off
docker image rm "poibas"
docker build -t "poibas" .
pause