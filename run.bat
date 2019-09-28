@echo off
:: usage:
::   run.bat [alice ip] [bob ip]

ipconfig | grep -A 3 'DockerNAT' | grep 'Address' | sed -n 's/.\+: \(.\+\)/\1/p' > host.ip
set /p DISPLAY=<host.ip
set DISPLAY=%DISPLAY%:0.0
del host.ip

if [%SHELL%] == [/bin/bash] (
	set DOCKER=winpty docker
) else (
	set DOCKER=docker
)

%DOCKER% run -it --rm --privileged --name c3cp -e DISPLAY=%DISPLAY% c3cp:latest %1 %2
