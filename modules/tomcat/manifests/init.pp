class tomcat {

package { 'tomcat7':
# require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}


service { 'tomcat7':
  ensure => running,
}





exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/sudo  /bin/rm -rf /var/lib/tomcat7/webapps/ashutosh.war && /usr/bin/sudo  /bin/rm -rf /var/lib/tomcat7/webapps/ashutosh &&  /bin/sleep 10 &&  /usr/bin/sudo  /usr/bin/wget http://92.246.244.145:8080/libs-snapshot-local/org/shephertz/Acme_Sample_App/0.0.1-SNAPSHOT/Acme_Sample_App-0.0.1-SNAPSHOT.war -O /var/lib/tomcat7/webapps/ashutosh.war',
  path => '/var/lib/tomcat7/webapps/',

}

}
