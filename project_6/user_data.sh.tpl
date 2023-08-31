#!/bin/bash
yum -y update
yum -y install httpd

myip=`curl http://169.254.169.254/latedst/meta-data/local-ipv4`
cat <<EOF > /var/www/html/index.html
<html>
<h2>Bulid by power of Terraform <font color="red> v0.12</font></h2><br>
Owner ${f_name} ${l_name} <br>
%{for x in names ~}
Hello to s{x} from ${f_name}<br>
%{ endfor ~}
</html>
EOF

sudo service httpd start
chkconfig httpd on  
#Build by Terraform using External Script!