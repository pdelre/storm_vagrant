# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# the epel archive seems to be fragile and sometimes changes
cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://archive.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

yum -y install gcc make gcc-c++ zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms

# PDR - installing kernel-devel manually since specific version is not found in the epel
rpm -ivh ftp://ftp.pbone.net/mirror/ftp.scientificlinux.org/linux/scientific/6.2/x86_64/updates/security/kernel-devel-`uname -r`.rpm

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config