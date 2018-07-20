FROM centos:6
MAINTAINER Carlos Fernando Gamboa "cgamboa@bnl.gov"

RUN yum upgrade -y

RUN groupadd -g 74 -r sshd
RUN useradd -c "Privilege-separated SSH" -u 74 -g sshd  -s /sbin/nologin \
  -s /sbin/nologin -r -d /var/empty/sshd sshd 2> /dev/null

RUN yum install -y http://mirror.centos.org/centos/6/extras/i386/Packages/epel-release-6-8.noarch.rpm
RUN yum install -y yum-priorities crudini
RUN yum install -y http://repo.opensciencegrid.org/osg/3.2/osg-3.2-el6-release-latest.rpm 
