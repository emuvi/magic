@echo off
docker image rm "pointel"
docker build -t "pointel" .
pause