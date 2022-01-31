@echo off
docker image rm "pinba"
docker builder prune -f --all
pause
