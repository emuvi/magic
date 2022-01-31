@echo off
docker image rm "pinde"
docker builder prune -f --all
pause