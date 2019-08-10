#!/bin/bash -xe
sudo amazon-linux-extras install tomcat8.5 && sudo chkconfig tomcat on
cd ~
mv /tmp/*.war .
sudo chmod 555 *.war
sudo mv *.war /usr/share/tomcat/webapps/

