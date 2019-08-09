#!/bin/bash -xe
sudo amazon-linux-extras install tomcat8.5 && sudo chkconfig tomcat on
cd ~
curl -O https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
sudo chmod 555 sample.war
sudo mv sample.war /usr/share/tomcat/webapps/
