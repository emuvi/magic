@echo off
docker image rm "pinde"
docker build -t "pinde" .
pause