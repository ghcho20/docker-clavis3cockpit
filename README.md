# docker-clavis3cockpit
To run GUI cockpit client on centos container for IDQ Clavis3.

## base
[centos:xwin](https://cloud.docker.com/u/ghcho20/repository/docker/ghcho20/centos) : CentOS 7 XWindow image.

XWindow-enabled image to run GUI applications on centos.

## prerequisite
[XcSvr](https://sourceforge.net/projects/vcxsrv/)
1. download from the above link
1. install
1. start '`XLaunch`' from Windows start menu
  * default option does enough when prompted at startup except needing to check `Disable access control` at the last step.
  
## prepare for running
1. copy clavis3cockpit(`*.tar.gz`) package to the folder
1. rename the package to `Clavis3Cockpit.tar.gz`.
> Clavis3 Cockpit release package is not uploaded here for IP protection

## build & run the cockpit
do `run.bat [<alice_ip>] [<bob_ip>]`
* the script will check and build the cockpit image for the first time : one-time procedure
* once the image is built, the cockpit container will start
* `<alice_ip>` : clavis3 Alice system
* `<bob_ip>` : clavis3 Bob system
> If clavis3 ip(alice|bob) is ommitted, you can set them in `Connect` menu
