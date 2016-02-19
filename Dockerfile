FROM centos:6
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

RUN yum upgrade -y

RUN groupadd -r gratia -g 600
RUN useradd -r -g gratia -u 600 -c "gratia runtime user" \
    -s /sbin/nologin -d /etc/gratia gratia
RUN groupadd -r condor -g 601
RUN useradd -r -g condor -u 601 -d /var/lib/condor -s /sbin/nologin \
    -c "Owner of HTCondor Daemons" condor
RUN groupadd -g 74 -r sshd
RUN useradd -c "Privilege-separated SSH" -u 74 -g sshd  -s /sbin/nologin \
  -s /sbin/nologin -r -d /var/empty/sshd sshd 2> /dev/null

RUN yum install -y http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y yum-priorities crudini
RUN yum install -y http://repo.grid.iu.edu/osg/3.2/osg-3.2-el6-release-latest.rpm 
