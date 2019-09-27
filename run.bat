@echo off
:: usage:
::   run.bat [alice ip] [bob ip]

for /f "usebackq" %%a in (`hostname`) do set HOST=%%a
for /f "tokens=2 skip=4 usebackq" %%a in (`nslookup %HOST%`) do set DISPLAY=%%a:0.0

if [%SHELL%] == [/bin/bash] (
	set DOCKER=winpty docker
) else (
	set DOCKER=docker
)

%DOCKER% run -it --rm --privileged --name c3cp -e DISPLAY=%DISPLAY% c3cp:latest %1 %2
