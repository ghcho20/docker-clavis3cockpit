@echo off
:: usage:
::   run.bat [alice ip] [bob ip]

set INAME=c3cp:latest
echo ^> Check image(%INAME%)
for /F "tokens=* USEBACKQ" %%I in (`docker images -q %INAME%`) do (
    set INAME_CHECK=%%I
)
if [%INAME_CHECK%]==[] (
    echo ^> Install docker image(%INAME%)
) else (
    echo ^> Image(%INAME%) found !
)
if [%INAME_CHECK%]==[] (
    docker build --rm -t %INAME% .
)

set DISPLAY=10.0.75.1:0.0

set CNAME=c3cp
echo ^> Launch a container(%CNAME%)
set DOCKER=docker
if [%SHELL%] == [/bin/bash] (
	set DOCKER=winpty %DOCKER%
)
%DOCKER% run --rm --name %CNAME% --privileged -e DISPLAY=%DISPLAY% -it %INAME% %1 %2

exit
