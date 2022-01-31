@echo off
docker image rm "pinba"
docker build -t "pinba" .
pause
