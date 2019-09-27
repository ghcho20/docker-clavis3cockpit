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
  * default option does enough when prompted at startup
  
## build clavis3cockpit image
1. copy clavis3cockpit(`*.tar.gz`) package to the folder
1. rename the package to `Clavis3Cockpit.tar.gz`.
1. do `install.bat`
1. check if `c3cp:latest` image is made

   ```
   $ docker images
   ----------------
   ID SIZE         f4ec116a9e13 1.58GB
   REPO:TAG        c3cp:latest
   58 minutes ago  @ 2019-09-27 17:41:19 +0900 KST
   ----------------
   ID SIZE         3d244a12c8be 1.39GB
   REPO:TAG        ghcho20/centos:xwin
   4 hours ago     @ 2019-09-27 14:34:36 +0900 KST
   ```

> Clavis3 Cockpit release package is not uploaded here for IP protection

## run the cockpit
do `run.bat [<alice_ip>] [<bob_ip>]`
* `<alice_ip>` : clavis3 Alice system
* `<bob_ip>` : clavis3 Bob system
> If system ip is ommitted, you can set them in `Connect` menu

## remove clavis3cockpit image
do `install.bat -u`
