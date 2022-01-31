@echo off
docker image rm "poibas"
docker builder prune -f --all
pause