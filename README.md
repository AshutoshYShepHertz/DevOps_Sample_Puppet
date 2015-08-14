

Steps for Puppet :

1.	Configure site.pp file on the puppet master, which is under /etc/puppet/manifest/
    [root@master manifests]# cat site.pp
    import 'nodes.pp'
    $puppetmaster = 'puppet’(which is our puppet master server)

import statement tells to import a file called nodes.pp. And then we have defined a variable called "puppetmaster" which can be used anywhere in our puppet manifest

Note: Making agent definitions inside a file called nodes.pp is a convention followed. You can create file with any name and import that file name in site.pp file.(what matters is the content of the file)

2.	[root@master manifests]# cat nodes.pp
    node ‘appnode1' {
    include tomcat
}


You can either include a class, or a module inside node

3.	Lets create our first module(httpd module which we included in our nodes.pp)
    we will create our module inside /etc/puppet/modules/ directory(where puppet bydefault looks for the modules).

[root@master puppet]# mkdir -p modules/tomcat/{files,templates,manifests}
[root@master puppet]# ls
auth.conf        manifests  puppet.conf
fileserver.conf  modules    puppet.conf.rpmsave

[root@master puppet]# touch modules/tomcat/manifests/init.pp



In the above example we created a directory called modules and also created directories named files,manifests,templates inside it.And we also created a file called init.pp inside manifests directory(which is very much necessary)
So the whole content of our module named tomcat will be inside the directory/etc/puppet/modules/tomcat/


    Now lets fill our init.pp file which we just created for our module named tomcat.


    /etc/puppet/modules/tomcat/manifests# vi init.pp

class tomcat {
            package { 'tomcat7':
            ensure => installed,
              }
            service { 'tomcat7':
            ensure => running,
}
exec { 'apt-update':
      command => '/usr/bin/sudo  /bin/rm -rf /var/lib/tomcat7/webapps/ashutosh.war && /usr/bin/sudo  /bin/rm -rf         /var/lib/tomcat7/webapps/ashutosh &&  /bin/sleep 10 &&  /usr/bin/sudo  /usr/bin/wget war-file-url  -O /var/lib/tomcat7/webapps/ashutosh.war',
      path => '/var/lib/tomcat7/webapps/',
    }
  }
  
   The following things are done till now.
    
    1.	Made a site.pp file with one variable and also imported nodes.pp file in it
      
    2.	we made a nodes.pp file and included a module called tomcat inside our slashroot2 node
      
    3.	we made a module named tomcat, with resources (package)
      
