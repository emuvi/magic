@echo off
docker image rm "poidel"
docker build -t "poidel" .
pause