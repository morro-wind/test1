#/bin/bash
sudo yum update -y
sudo yum upgrade -y

sudo yum groupinstall "Development Libraries"
sudo yum groupinstall "Development Tools"

sudo yum install yum-utils

sudo cat > /etc/yum.repos.d/nginx.repo <<EOF
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/6/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/6/x86_64/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
EOF

sudo yum-config-manager --enable nginx-mainline
sudo yum install nginx -y


curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo sed -i "s/\$releasever/6/" /etc/yum.repos.d/mariadb.repo
sudo yum install MariaDB-server MariaDB-client -y

#/etc/nginx/conf.d/*.conf
