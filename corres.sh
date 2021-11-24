export TERM=xterm
export DLC=/var/lib/minishift/test/dlc102b
export PATH=%DLC:$DLC/bin:$DLC/oebpm/server/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/dlc/dba/procomdb
#cd /opt/lampp/htdocs/Vida/
/var/lib/minishift/test/dlc102b/bin/_progres -b -p $1 

