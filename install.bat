@echo off

if [%1] == [-u] (
	docker rmi c3cp:latest
) else if [%1] == [] (
	docker build --rm -t c3cp:latest .
) else (
	echo invalid option: %1
	echo use:
	echo   install.bat
	echo   install.bat -u
)
