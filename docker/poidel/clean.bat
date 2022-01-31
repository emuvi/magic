@echo off
docker image rm "poidel"
docker builder prune -f --all
pause